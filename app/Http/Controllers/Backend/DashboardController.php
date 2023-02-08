<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Mail\UpdateOrder;
use App\Models\Order;
use App\Models\OrderDetails;
use App\Models\Product;
use App\Models\Shop;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;
use RealRashid\SweetAlert\Facades\Alert;
use Maatwebsite\Excel\Facades\Excel;
use App\Exports\OrderExport;
use App\Models\Withdraw;
use Barryvdh\DomPDF\Facade\Pdf;

class DashboardController extends Controller
{
  private $VIEW_PATH = "backend.";

  public function dashboard()
  {
    if (auth()->user()->role == 'Customer') {
      $orders = Order::whereUserId(auth()->id())->latest()->take(5)->get();
    } elseif (auth()->user()->role == 'Admin') {
      $orders = Order::latest()->take(5)->get();
    } elseif (auth()->user()->role == 'Seller') {
      $order_ids = OrderDetails::whereUserId(auth()->user()->id)->pluck('order_id');
      $orders_data = Order::whereIn('id', $order_ids);
      $orders = $orders_data->latest()->take(5)->get();
    }

    $amount = $orders->sum('amount') - $orders->sum('coupon_discount_amount');

    if (auth()->user()->role == 'Seller') {
      $shops = Shop::whereStatus('Active')->count();
      $complete_order = array_filter($orders_data->get()->toArray(), function ($sale) {
        return $sale['status'] == 'Complete' ? $sale : null;
      });

      foreach ($complete_order as $item) {
        $sale = $item['amount'] - $item['coupon_discount_amount'];
      }

      $customers = User::find($orders_data->pluck('user_id'))->count();
      $products = count(array_filter(auth()->user()->product->toArray(), function ($product) {
        return $product['status'] == 'Active' ? 1 : 0;
      }));
     
      $sales=  Order::join('order_details', 'orders.id', '=', 'order_details.order_id')
                    ->where('order_details.user_id', auth()->id())
                    ->where('orders.status', 'complete')
                    ->sum('orders.amount', '-', 'orders.coupon_discount_amount');
      
      
      return view($this->VIEW_PATH . 'dashboard', compact('customers', 'products', 'orders', 'amount', 'sales'));
    } elseif (auth()->user()->role == 'Admin') {
      $bestSellingProduct = OrderDetails::select('product_id', DB::raw('count(*) as total'))->groupBy('product_id')->orderBy('total', 'DESC')->limit(5)->get();
      $shops = Shop::whereStatus('Active')->count();
      $widthdrawAmound= Withdraw::sum('amount');
      $latestWithdraw = Withdraw::orderBy('created_at', 'DESC')->paginate(5);
      $customers = User::whereRole('Customer')->count();
      $products = Product::whereStatus('Active')->count();
      $sales = Order::whereStatus('Complete')->value(DB::raw("SUM(amount - coupon_discount_amount)"));
      return view($this->VIEW_PATH . 'dashboard', compact('customers', 'products', 'sales', 'orders', 'amount', 'shops', 'bestSellingProduct' ,'latestWithdraw', 'widthdrawAmound')); 
    }
    return view($this->VIEW_PATH . 'dashboard', compact('orders'));
  }


  public function orderList(Request $request)
  {

    //  Unpaid & Payment method Card dekha jabe na.
    if (auth()->user()->role == "Seller") {
      $seller_products_id = auth()->user()->product->pluck('id');

      $orders_id = array_unique(OrderDetails::whereIn('product_id', $seller_products_id)->pluck('order_id')->toArray());

      $sql = OrderDetails::orderBy('created_at', 'DESC')->whereIn('order_id', $orders_id);
    } elseif (auth()->user()->role == "Customer") {
      $sql = Order::orderBy('created_at', 'DESC')->where('user_id', auth()->id());
    } else {
      $sql = Order::orderBy('created_at', 'DESC');
    }

    $page = 'index';
    $keyword = '';
    if ($request->keyword) {
      $keyword = $request->keyword;
      $sql->whereHas('user', function ($q) use ($keyword) {
        $q->where('name', 'like', '%' . $keyword . '%');
      })
        ->orWhere('id', $keyword)
        ->orWhere('payment_method', 'like', '%' . $keyword . '%')
        ->orWhere('status', 'like', '%' . $keyword . '%');
    }

    $orders = $sql->paginate(5);
    return view($this->VIEW_PATH . 'orders.index', compact('orders', 'keyword', 'page'));
  }

  public function customerList()
  {
    $seller_products_id = auth()->user()->product->pluck('id');
    $orders_id = array_unique(OrderDetails::whereIn('product_id', $seller_products_id)->pluck('order_id')->toArray());
    $users = array_unique(Order::orderBy('created_at', 'DESC')->whereIn('id', $orders_id)->pluck('user_id')->toArray());
    $data = User::whereIn('id', $users)->paginate(10);
    return view($this->VIEW_PATH . 'seller.customer', compact('data'));
  }

  public function show(Order $order, $id)
  {
    $page = 'show';
    

    if (auth()->user()->role == 'Admin' || auth()->user()->role == 'Customer') {
      $singleOrder = $order->findOrFail($id);
    }
    // return $singleOrder;
    return view($this->VIEW_PATH . 'orders.index', compact('singleOrder', 'page'));
  }

  public function showDetails(OrderDetails $orderDetails, $id)
  {
    $page = 'show';
    $singleOrder = $orderDetails->findOrFail($id);
    return view($this->VIEW_PATH . 'orders.index', compact('singleOrder', 'page'));
  }
 
  public function updateStatus(Order $order, $status)
  {
    if ($status == 'complete') {
      foreach ($order->order_details as $item) {
        $seller = User::findOrFail($item->user_id);

        $seller->update([
          'balance' => $seller->balance + ($item->unit_price * $item->quantity)
        ]);
      }
    }
    

    $order->update([
      'status' => ucfirst($status)
    ]);

    Mail::to($order->user->email)->send(new UpdateOrder($order));

    Alert::success('Status !', 'Status updated successfully !');
    return redirect()->back();
  }


  public function notificationRead($id)
  {
    $admin = auth()->user();
    if ($id) {
      $admin->notifications->where('id', $id)->markAsRead();
    }
    return back();
  }

  public function download(Request $request)
  {
    $from = date('Y-m-d', strtotime($request->from));
    $to = date('Y-m-d', strtotime($request->to));
    if ($request->excel) {
      return Excel::download(new OrderExport($from, $to), 'orders.xlsx');
    } else {

      if (auth()->user()->role == "Seller") {
        $seller_products_id = auth()->user()->product->pluck('id');

        $orders_id = array_unique(OrderDetails::whereIn('product_id', $seller_products_id)->pluck('order_id')->toArray());

        $orders = OrderDetails::whereBetween('created_at', [$from, $to])->whereIn('order_id', $orders_id);

        $pdf = Pdf::loadView('exports.seller_order', compact('orders'));
        return $pdf->download('orders.pdf');
      } else {
        $orders = Order::whereBetween('created_at', [$from, $to])->get();
        $pdf = Pdf::loadView('exports.orders', compact('orders'));
        return $pdf->download('orders.pdf');
      }
    }
  }
}
