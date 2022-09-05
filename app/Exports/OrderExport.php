<?php

namespace App\Exports;

use App\Models\Order;
use Illuminate\Contracts\View\View;
use Maatwebsite\Excel\Concerns\FromView;

class OrderExport implements FromView
{
  /**
   * @return \Illuminate\Support\Collection
   */
  public $from;
  public $to;

  public function __construct($from, $to)
  {
    $this->from = $from;
    $this->to = $to;
  }

  public function view(): View
  {
    return view('exports.orders', [
      'orders' => Order::whereBetween('created_at', [$this->from, $this->to])->get()
    ]);
  }
}
