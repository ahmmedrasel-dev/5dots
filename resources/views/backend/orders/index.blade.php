@extends('backend.master')
@section('order_active') active @endsection

@section('content')
<style>
  @page {
    size: auto;
    margin: 0mm;
  }
</style>

<div class="page-inner">
  <div class="page-title" id="page-title">
    <div class="page-breadcrumb">
      <ol class="breadcrumb breadcrumb-with-header">
        <li><a href="{{ url(routePrefix(). '/dashboard') }}">Dashboard</a></li>
        <li><a href="{{ url(routePrefix(). '/order-list') }}">Order</a></li>
        <li class="active">Order-list</li>
      </ol>
    </div>
  </div>
  <div id="main-wrapper">
    <div class="row">
      @if($page == 'index')
      <div class="col-md-12">
        <div class="row mailbox-header">
          <div class="col-md-9">
            <div class="row">
              <div class="col-md-7">
                <form action="{{ route('download') }}" method="get">
                  <div class="input-group" style="display: flex">

                    <input type="text" class="form-control date-picker" placeholder="From" name="from">
                    <input type="text" class="form-control date-picker" placeholder="To" name="to">
                    <input class="btn btn-info" name="excel" type="submit" value="Download Excel"
                      style="margin: 0 10px">
                    <input class="btn btn-warning" name="pdf" type="submit" value="Download PDF">
                  </div>
                </form>
              </div>
              <div class="col-md-3">
              </div>
            </div>
          </div>

          <div class="col-md-3">
            <form action="{{ url(routePrefix() . '/orders') }}" method="get">
              <div class="input-group">
                <input class="form-control input-search" type="search" name="keyword"
                  value="{{ isset($keyword) ? $keyword : ''  }}" placeholder="Search from here...">
                <span class="input-group-btn">
                  <button class="btn btn-info" type="submit"><i class="fa fa-search"></i></button>
                </span>
                <span class="input-group-btn">
                  <a href="{{ url( routePrefix() .'/orders') }}" class="btn btn-warning"
                    style="margin-left: 10px">Clear</a>
                </span>
              </div>
            </form>
          </div>
        </div>

        <div class="panel panel-white">
          @if(routePrefix() === 'admin')
          <div class="panel-body">
            <div class="table-responsive">
              <table class="display table" style="width: 100%; cellspacing: 0;">
                <thead>
                  <tr>
                    <th>Order ID</th>
                    <th>Total Amount</th>
                    <th>Order Create</th>
                    <th>Payment Method</th>
                    <th>Status</th>
                    <th>Customer</th>
                    <th>Date</th>
                    <th>Action</th>
                  </tr>
                </thead>
                <tbody>

                  @foreach($orders as $item)
                  <tr>
                    <td>#{{ $item->id }}</td>
                    <td>
                      SA {{ number_format($item->amount + $item->shipping_cost + $item->tax -
                      $item->coupon_discount_amount, 2) }}
                    </td>
                    <td>
                      {{ $item->created_at->diffForHumans() }}
                    </td>


                    <td>
                      {{ $item->payment_method }}
                    </td>
                    <td>
                      @if($item->status == 'Complete')
                      @php
                      $status = 'success';
                      @endphp
                      @elseif($item->status == 'Cancel')
                      @php
                      $status = 'danger';
                      @endphp
                      @elseif($item->status == 'Accept')
                      @php
                      $status = 'info';
                      @endphp
                      @elseif($item->status == 'Pending')
                      @php
                      $status = 'warning';
                      @endphp
                      @endif
                      <span class="badge badge-pill badge-{{$status}}">
                        {{ $item->status }}
                      </span>
                    </td>
                    <td>
                      {{ $item->user->email }}
                    </td>



                    <td>{{ $item->created_at->format('d-M-Y') }}</td>
                    <td>
                      <a class="btn btn-info" href="{{ url(routePrefix(). '/order/' . $item->id) }}"><i
                          class="fa fa-eye"></i></a>

                      @if(auth()->user()->role == 'Admin')
                      @if($item->status == 'Pending')
                      <a class="btn btn-success"
                        href="{{ url(routePrefix(). '/order/' . $item->id . '/update/accept') }}">
                        <i class="fa fa-check"></i>
                      </a>
                      <a class="btn btn-warning"
                        href="{{ url(routePrefix(). '/order/' . $item->id . '/update/cancel') }}">
                        <i class="fa fa-times"></i>
                      </a>
                      @elseif($item->status == 'Accept')
                      <a class="btn btn-success"
                        href="{{ url(routePrefix(). '/order/' . $item->id . '/update/complete') }}">
                        <i class="fa fa-check"></i>
                      </a>
                      @endif
                      @endif
                    </td>
                  </tr>
                  @endforeach
                </tbody>
              </table>
              {{ $orders->links() }}
            </div>
          </div>
          @endif

          @if(routePrefix() === 'seller')
          <div class="panel-body">
            <div class="table-responsive">
              <table class="display table" style="width: 100%; cellspacing: 0;">
                <thead>
                  <tr>
                    <th>Order ID</th>
                    <th>Total Amount</th>
                    <th>SKU Number</th>
                    <th>Payment Method</th>
                    <th>Status</th>
                    <th>Customer</th>
                    <th>Date</th>
                    <th>Order Create</th>
                    <th>Action</th>
                  </tr>
                </thead>
                <tbody>

                  @foreach($orders as $item)
                  <tr>
                    <td>#{{ $item->order_id }}</td>
                    <td>{{ number_format($item->unit_price, 2) }}</td>
                    <td>{{ $item->product->product_sku }}</td>

                    <td>{{ $item->order->payment_method }}</td>
                    <td>
                      @if($item->order->status == 'Complete')
                      @php
                      $status = 'success';
                      @endphp
                      @elseif($item->order->status == 'Cancel')
                      @php
                      $status = 'danger';
                      @endphp
                      @elseif($item->order->status == 'Accept')
                      @php
                      $status = 'info';
                      @endphp
                      @elseif($item->order->status == 'Pending')
                      @php
                      $status = 'warning';
                      @endphp
                      @endif
                      <span class="badge badge-pill badge-{{$status}}">
                        {{ $item->order->status }}
                      </span>
                    </td>
                    <td>{{ $item->order->user->name }}</td>
                    <td>{{ $item->created_at->format('d-M-Y') }}</td>
                    <td>{{ $item->created_at->diffForHumans() }}</td>
                    <td>
                      <a class="btn btn-info" href="{{ url(routePrefix(). '/order-details/' . $item->id) }}"><i
                          class="fa fa-eye"></i></a>
                    </td>


                  </tr>
                  @endforeach
                </tbody>
              </table>
              {{ $orders->links() }}
            </div>
          </div>
          @elseif(routePrefix() === 'customer')
          <div class="panel-body">
            <div class="table-responsive">
              <table class="display table" style="width: 100%; cellspacing: 0;">
                <thead>
                  <tr>
                    <th>Order ID</th>
                    <th>Total Amount</th>
                    <th>Order Create</th>
                    <th>Payment Method</th>
                    <th>Status</th>
                    <th>Customer</th>
                    <th>Date</th>
                    <th>Action</th>
                  </tr>
                </thead>
                <tbody>

                  @foreach($orders as $item)
                  <tr>
                    <td>#{{ $item->id }}</td>
                    <td>
                      SA {{ $item->amount + $item->shipping_cost + $item->tax - $item->coupon_discount_amount }}
                    </td>
                    <td>
                      {{ $item->created_at->diffForHumans() }}
                    </td>

                    <td>
                      {{ $item->payment_method }}
                    </td>
                    <td>
                      @if($item->status == 'Complete')
                      @php
                      $status = 'success';
                      @endphp
                      @elseif($item->status == 'Cancel')
                      @php
                      $status = 'danger';
                      @endphp
                      @elseif($item->status == 'Accept')
                      @php
                      $status = 'info';
                      @endphp
                      @elseif($item->status == 'Pending')
                      @php
                      $status = 'warning';
                      @endphp
                      @endif
                      <span class="badge badge-pill badge-{{$status}}">
                        {{ $item->status }}
                      </span>
                    </td>
                    <td>
                      {{ $item->user->name }}
                    </td>

                    <td>{{ $item->created_at->format('d-M-Y') }}</td>
                    <td>
                      <a class="btn btn-info" href="{{ url(routePrefix(). '/order/' . $item->id) }}"><i
                          class="fa fa-eye"></i></a>
                    </td>
                  </tr>
                  @endforeach
                </tbody>
              </table>
              {{ $orders->links() }}
            </div>
          </div>

          @endif
        </div>
      </div>
    </div>

    @elseif($page == 'show')

    <div id="main-wrapper">
      <div class="row" id="print_invoice">
        <div class="invoice col-md-12">
          <div class="panel panel-white">
            <div class="panel-body">
              <div class="row">
                <div class="col-md-12">
                  <table class="table">
                    <tr>
                      <td style="border-top: none !important;">
                        <h2 class="m-b-md m-t-xxs"><b>5dots</b></h2>
                        Al-Khobar<br>
                        Phone: +966 53 458 8012
                      </td>
                      <td class="text-right" style="border-top: none !important;">
                        <h2 class="m-b-md m-t-xxs">Invoice: #{{ $singleOrder->id }}</h2>
                        <a href="{{ url( routePrefix() .'/orders') }}" class="btn btn-info btn-sm" id="button">Go
                          back</a>
                        <button type="button" class="btn btn-default" onclick="invoicePrint()"><i
                            class="fa fa-print"></i>
                          Print</button>
                      </td>
                    </tr>
                    <tr>
                      <td>

                        @if(auth()->user()->role == 'Admin' || auth()->user()->role == 'Customer')
                        <strong class="m-b-md">Customer Details</strong><br>
                        @if($singleOrder->user && $singleOrder->user->userDetail)
                        <b>Name:</b> {{ $singleOrder->user->name }}<br>
                        <b>Email:</b> {{ $singleOrder->user->email }}<br>
                        <b>Phone:</b> {{ $singleOrder->user->userDetail->phone }}<br>
                        <p><b>Shipping: </b>{{ $singleOrder->user->userDetail->postal_code }}, {{
                          $singleOrder->user->userDetail->address }}, {{
                          $singleOrder->city($singleOrder->user->userDetail->city_id) }}, <br>{{
                          $singleOrder->state($singleOrder->user->userDetail->state_id) }}.
                        </p>
                        @else
                        N/A
                        @endif

                        @else
                        <strong class="m-b-md">Seller Details</strong><br>
                        <b>Name:</b> {{ $singleOrder->user->name }}<br>
                        <b>Email:</b> {{ $singleOrder->user->email }}<br>
                        <b>Phone:</b> {{ $singleOrder->user->phone ?? '' }}<br>
                        @endif
                      </td>


                      <td class="text-right">

                        @if(auth()->user()->role == 'Admin' || auth()->user()->role == 'Customer')
                        <strong class="m-b-md">Order Details</strong><br>
                        <p>
                          <b>Date: </b>{{ $singleOrder->created_at->format('d/m/y') }}<br><b>Order Status: </b>
                          {{ $singleOrder->status }}<br>
                          <b>Payment Method: </b> {{ $singleOrder->payment_method }}<br>
                          <b>Payment Status: </b> {{ $singleOrder->is_paid }}
                        </p>
                        @else
                        <strong class="m-b-md">Customer Details</strong><br>
                        <p>
                          {{ $singleOrder->order->user->name }}<br>
                          {{ $singleOrder->order->user->email }}<br>
                          {{ $singleOrder->order->user->userDetail->phone }}<br>


                        </p>
                        @endif
                      </td>
                    </tr>
                  </table>
                </div>

                <div class="col-md-12">
                  <table class="table table-striped">
                    <thead>
                      <tr>
                        <th>SL</th>
                        <th>Product Name</th>
                        <th>SKU</th>
                        <th>Size</th>
                        <th>Color</th>
                        <th>Quanity</th>
                        <th>Price</th>
                        <th class="text-right">Total</th>
                      </tr>
                    </thead>
                    @php
                    $total = 0;
                    @endphp
                    <tbody>
                      @if(auth()->user()->role !== 'Seller')

                      @foreach($singleOrder->order_details as $key => $order)
                      <tr>
                        <td>{{ $key+1 }}</td>
                        <td>{{ $order->product->name }}</td>
                        <td>{{ $order->product->product_sku }}</td>
                        <td>
                          @if(!empty($order->size))
                          {{ $order->size }}
                          @endif
                        </td>
                        <td>
                          @if(!empty($order->color))
                          {{ $order->color }}
                          @endif
                        </td>
                        <td>
                          {{ $order->quantity }}
                        </td>
                        <td>
                          SA {{ $order->unit_price }}
                        </td>
                        <td class="text-right">
                          SA {{ $order->unit_price * $order->quantity}}
                        </td>

                        @php
                        $total += ($order->unit_price * $order->quantity)
                        @endphp
                      </tr>
                      @endforeach
                      @else
                      <tr>
                        <td>{{ 1 }}</td>
                        <td>{{ $singleOrder->product->name }}</td>
                        <td>{{ $singleOrder->product->product_sku }}</td>
                        <td>
                          @if(!empty($singleOrder->size))
                          {{ $singleOrder->size }}
                          @endif
                        </td>
                        <td>
                          @if(!empty($singleOrder->color))
                          {{ $singleOrder->color }}
                          @endif
                        </td>
                        <td>
                          {{ $singleOrder->quantity }}
                        </td>
                        <td>
                          SA {{ number_format($singleOrder->unit_price, 2) }}
                        </td>
                        <td class="text-right">
                          SA {{ number_format($singleOrder->quantity * $singleOrder->unit_price, 2) }}
                        </td>

                        @php
                        $total += ($singleOrder->unit_price * $singleOrder->quantity)
                        @endphp
                      </tr>

                      @endif
                    </tbody>
                  </table>
                </div>
                <div class="col-md-12">

                  <table class="table">
                    <tr>
                      @if(auth()->user()->role == 'Admin' || auth()->user()->role == 'Customer')

                      @php
                      $discount = $singleOrder->coupon_discount_amount
                      @endphp
                      <td width="75%" style="border-top: none;"></td>
                      <td style="border-top: none;">
                        <table class="table">
                          <tr>
                            <td class="text-right" style="padding: 5px !important">
                              <h4 class="no-m">Subtotal</h4>
                              <h3 class="no-m m-t-sm">SA {{ number_format($total, 2) }}</h3>
                            </td>
                          </tr>

                          <tr>
                            <td class="text-right" style="padding: 5px !important">
                              <h4 class="no-m">Shipping</h4>
                              <h3 class="no-m m-t-sm">SA {{ number_format($singleOrder->shipping_cost, 2) }}</h3>
                            </td>
                          </tr>

                          <tr>
                            <td class="text-right" style="padding: 5px !important">
                              <h4 class="no-m">Tax</h4>
                              <h3 class="no-m m-t-sm">SA {{ $singleOrder->tax }}</h3>
                            </td>
                          </tr>

                          <tr>
                            <td class="text-right" style="padding: 5px !important">
                              <h4 class="no-m">Discount</h4>
                              <h3 class="no-m m-t-sm">SA {{ number_format($discount, 2) }}</h3>
                            </td>
                          </tr>

                          <tr>
                            <td class="text-right" style="padding: 5px !important">
                              <h4 class="no-m text-success">Total Amount</h4>
                              <h2 class="no-m text-success m-t-sm">SA {{ number_format(($singleOrder->amount +
                                $singleOrder->shipping_cost
                                +
                                $singleOrder->tax) - $discount, 2) }}</h2>
                            </td>
                          </tr>
                        </table>
                      </td>
                      @else
                      @php
                      $discount = $singleOrder->order->coupon_discount_amount
                      @endphp

                      <td width="75%" style="border-top: none;"></td>
                      <td style="border-top: none;">
                        <table class="table">
                          <tr>
                            <td class="text-right" style="padding: 5px !important">
                              <h4 class="no-m">Subtotal</h4>
                              <h3 class="no-m m-t-sm">SA {{ number_format($total, 2) }}</h3>
                            </td>
                          </tr>

                          <tr>
                            <td class="text-right" style="padding: 5px !important">
                              <h4 class="no-m">Shipping</h4>
                              <h3 class="no-m m-t-sm">SA {{ number_format($singleOrder->order->shipping_cost, 2) }}</h3>
                            </td>
                          </tr>

                          <tr>
                            <td class="text-right" style="padding: 5px !important">
                              <h4 class="no-m">Tax</h4>
                              <h3 class="no-m m-t-sm">SA {{ $singleOrder->order->tax }}</h3>
                            </td>
                          </tr>

                          <tr>
                            <td class="text-right" style="padding: 5px !important">
                              <h4 class="no-m text-success">Total Amount</h4>
                              <h2 class="no-m text-success m-t-sm">SA {{ number_format(($total +
                                $singleOrder->order->shipping_cost
                                +
                                $singleOrder->order->tax), 2) }}</h2>
                            </td>
                          </tr>
                        </table>
                      </td>
                      @endif
                    </tr>
                  </table>
                </div>

              </div>
              <!--row-->
            </div>
          </div>
        </div>
      </div><!-- Row -->
    </div><!-- Main Wrapper -->
    @endif


  </div><!-- Main Wrapper -->
  <div class="page-footer" id="page-footer">
    <p class="no-s">Made with <i class="fa fa-heart"></i> by 5dots</p>
  </div>
</div><!-- Page Inner -->
@endsection

@section('footer_js')
<script>
  let button = document.getElementById("button");
  let page_title = document.getElementById("page-title");
  let footer = document.getElementById("page-footer")
  function invoicePrint() {
    footer.style.display = 'none'
    button.style.display = 'none'
    page_title.style.display = 'none'
    window.print()
  }
</script>
@endsection