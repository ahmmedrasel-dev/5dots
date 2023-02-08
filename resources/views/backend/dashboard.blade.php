@extends('backend.master')
@section('dashboard_active')
active
@endsection
@section('content')
<div class="page-inner">
  <div class="page-title">
    <div class="page-breadcrumb">
      <ol class="breadcrumb">
        <li><a href="{{ url('/') }}">Home</a></li>
        <li class="active">Dashboard</li>
      </ol>
    </div>
  </div>
  <div id="main-wrapper">
    <div class="row">

      @if(auth()->user()->role == 'Admin')
      <div class="col-lg-3 col-md-6">
        <div class="panel-green dashboar-card">
          <div>
            <h3>Total Sales</h3>
            <h2><span data-plugin=" counterup">SA {{ $sales ?? 0 }}</span>
            </h2>
          </div>
          <div>
            <i class="fa fa-money" aria-hidden="true"></i>
          </div>
        </div>
      </div><!-- end col -->

      <div class="col-lg-3 col-md-6">
        <div class="panel-blue dashboar-card">
          <div>
            <h3>Total Customer</h3>
            <h2><span data-plugin=" counterup">{{ $customers }}</span>
            </h2>
          </div>
          <div>
            <i class="fa fa-user"></i>
          </div>
        </div>
      </div><!-- end col -->

      <div class="col-lg-3 col-md-6">
        <div class="panel-yellow dashboar-card">
          <div>
            <h3>Total Product</h3>
            <h2><span data-plugin=" counterup">{{ $products }}</span>
            </h2>
          </div>
          <div>
            <i class="fa fa-shopping-bag" aria-hidden="true"></i>

          </div>
        </div>
      </div><!-- end col -->

      <div class="col-lg-3 col-md-6">
        <div class="panel-red dashboar-card">
          <div>
            <h3>Total Shop</h3>
            <h2><span data-plugin=" counterup">{{ $shops }}</span>
            </h2>
          </div>
          <div>
            <i class="icon-home"></i>
          </div>
        </div>
      </div><!-- end col -->

      @elseif(auth()->user()->role == 'Seller')
      <div class="col-lg-4 col-md-6">
        <div class="panel-green dashboar-card">
          <div>
            <h3>Total Sales</h3>
            <h2><span data-plugin=" counterup">SA {{ $sales ?? 0 }}</span>
            </h2>
          </div>
          <div>
            <i class="fa fa-money" aria-hidden="true"></i>
          </div>
        </div>
      </div><!-- end col -->

      <div class="col-lg-4 col-md-6">
        <div class="panel-blue dashboar-card">
          <div>
            <h3>Total Customer</h3>
            <h2><span data-plugin=" counterup">{{ $customers }}</span>
            </h2>
          </div>
          <div>
            <i class="fa fa-user"></i>
          </div>
        </div>
      </div><!-- end col -->

      <div class="col-lg-4 col-md-6">
        <div class="panel-yellow dashboar-card">
          <div>
            <h3>Total Product</h3>
            <h2><span data-plugin=" counterup">{{ $products }}</span>
            </h2>
          </div>
          <div>
            <i class="fa fa-shopping-bag" aria-hidden="true"></i>

          </div>
        </div>
      </div><!-- end col -->
      @endif

    </div>
    <!-- end row -->
    <hr>

    <div class="row">
      @if(auth()->user()->role == 'Admin')
      <div class="col-md-6">
        <div class="panel panel-white">
          <div class="panel-body statement-card">
            <div class="statement-card-head">
              <h3>Latest Withdrow Request</h3>
              <p><small>Amount: </small><b>SA {{ number_format($widthdrawAmound, 2) }}</b></p>
            </div>
            <table class="table table-responsive">
              <tbody>
                @foreach($latestWithdraw as $item)
                <tr>
                  <th scope="row">{{ $item->created_at->format('d-M-y') }}</th>
                  <td>{{ $item->user->name }}</td>
                  <td>
                    @if($item->status == 'Paid')
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
                  <td class="text-success"><b>SA {{ number_format($item->amount, 2) }}</b></td>
                </tr>
                @endforeach
              </tbody>
            </table>
          </div>
        </div>
      </div>

      <div class="col-md-6">
        <div class="panel panel-white">
          <div class="panel-body statement-card">
            @if(auth()->user()->role == 'Admin' || auth()->user()->role == 'Seller')
            <div class="statement-card-head">
              <h3>Latest Orders</h3>
              <p><small>Amount: </small><b>SA {{ number_format($amount, 2) }}</b></p>
            </div>
            @endif

            <table class="table table-responsive">
              <thead>
                <tr>
                  <th>Order Id</th>
                  <th>Date</th>
                  <th>Status</th>
                  <th>Total</th>
                </tr>
              </thead>
              <tbody>
                @forelse($orders as $item)
                <tr>
                  <td scope="row">#{{ $item->id }}</td>
                  <td>{{ $item->created_at->format('d-M-y') }}</td>
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
                  <td class="text-success"><b>SA {{ $item->amount }}</b></td>
                </tr>
                @empty
                <tr>
                  <td>No Product Avaiable</td>
                </tr>
                @endforelse
              </tbody>
            </table>
          </div>
        </div>
      </div>

      <div class="col-md-12">
        <div class="panel panel-white">
          <div class="panel-body statement-card">
            <div class="statement-card-head">
              <h3>Best Selling Products</h3>
            </div>
            <table class="table table-responsive">
              <thead>
                <tr>
                  <th>Sl</th>
                  <th>Product Image</th>
                  <th>Product Name</th>
                  <th>SKU Number</th>
                  <th>Product Seller</th>
                  <th>Total Sale</th>
                  <th>Price</th>
                </tr>
              </thead>
              <tbody>
                @foreach($bestSellingProduct as $key => $item)
                <tr>
                  <td>{{ $key + 1}}</td>
                  <td>
                    <img style="width: 50px" src="{{ asset('backend/uploads/'. $item->product->thumbnail) }}"
                      alt="{{ $item->product->name }}">
                  </td>
                  <td>{{ $item->product->name }}</td>
                  <td>{{ $item->product->product_sku }}</td>
                  <td>{{ $item->product->user->name }}</td>
                  <td>{{ $item->total }}</td>
                  <td class="text-success"><b>SA {{ $item->product->price }}</b></td>
                </tr>
                @endforeach
              </tbody>
            </table>
          </div>
        </div>
      </div>
      @elseif(auth()->user()->role == 'Seller')

      <div class="col-md-6">
        <div class="panel panel-white">
          <div class="panel-body statement-card">
            <div class="statement-card-head">
              <h3>Latest Withdrow</h3>
              <p><sup>$</sup><b>207,430</b></p>
            </div>
            <table class="table table-responsive">
              <tbody>
                <tr>
                  <th scope="row">ORDER ID 4111</th>
                  <td>johndoe</td>
                  <td>N1</td>
                  <td class="text-success"><b>$16</b></td>
                </tr>

                <tr>
                  <th scope="row">ORDER ID 4111</th>
                  <td>johndoe</td>
                  <td>N1</td>
                  <td class="text-success"><b>$16</b></td>
                </tr>

                <tr>
                  <th scope="row">ORDER ID 4111</th>
                  <td>johndoe</td>
                  <td>N1</td>
                  <td class="text-success"><b>$16</b></td>
                </tr>

                <tr>
                  <th scope="row">ORDER ID 4111</th>
                  <td>johndoe</td>
                  <td>N1</td>
                  <td class="text-success"><b>$16</b></td>
                </tr>

                <tr>
                  <th scope="row">ORDER ID 4111</th>
                  <td>johndoe</td>
                  <td>N1</td>
                  <td class="text-success"><b>$16</b></td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>

      <div class="col-md-6">
        <div class="panel panel-white">
          <div class="panel-body statement-card">
            @if(auth()->user()->role == 'Admin' || auth()->user()->role == 'Seller')
            <div class="statement-card-head">
              <h3>Latest Orders</h3>
              <p><small>Amount: </small><b>SA {{ number_format($amount, 2) }}</b></p>
            </div>
            @endif

            <table class="table table-responsive">
              <thead>
                <tr>
                  <th>Order Id</th>
                  <th>Date</th>
                  <th>Status</th>
                  <th>Total</th>
                </tr>
              </thead>
              <tbody>
                @foreach($orders as $item)
                <tr>
                  <td scope="row">#{{ $item->id }}</td>
                  <td>{{ $item->created_at->format('d-M-y') }}</td>
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
                  <td class="text-success"><b>SA {{ number_format($item->amount, 2) }}</b></td>
                </tr>
                @endforeach
              </tbody>
            </table>
          </div>
        </div>
      </div>

      @endif


    </div>
  </div><!-- Main Wrapper -->
  <div class="page-footer">
    <p class="no-s">Made with <i class="fa fa-heart"></i> by 5dots</p>
  </div>
</div><!-- Page Inner -->
@endsection