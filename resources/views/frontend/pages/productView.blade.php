@extends('frontend.master')
@section('header_css')
<link rel="stylesheet" href="{{ asset('/frontend/assets') }}/css/jquery.nice-number.min.css">
<link rel="stylesheet" href="{{ asset('/frontend/assets') }}/css/jquery-picZoomer.css">
<link rel="stylesheet" href="{{ asset('/frontend/assets') }}/css/reset.css">
@endsection
@section('content')

<style>
  .description-head li a.active {
    color: orangered;
  }
</style>
<main>
  <section id="product-detials">
    <div class="container">
      <div class="row">
        <div class="col-md-6">
          <div class="product-image">
            <div class="slider">

              <div class="slide-item">
                <img id="img_01" class="img-fluid"
                  data-zoom-image="{{ asset('backend/uploads/' . $product->thumbnail ) }}"
                  src="{{ asset('backend/uploads/' . $product->thumbnail) }}" alt="Feature Images">
              </div>

              @foreach($product->images as $image)
              <div class="slide-item">
                <img id="img_01" data-zoom-image="{{ asset('backend/uploads/' . $image->image) }}" class="img-fluid"
                  src="{{ asset('backend/uploads/' . $image->image) }}" alt="Feature Images">
              </div>
              @endforeach

            </div>

            <div class="slide-nav">
              <div class="slide-nav-item">
                <img class="w-75" src="{{ asset('backend/uploads/' . $product->thumbnail) }}" alt="product-thubnail">
              </div>

              @foreach($product->images as $image)
              <div class="slide-nav-item">
                <img class="w-75" src="{{ asset('backend/uploads/' . $image->image) }}" alt="product-thubnail">
              </div>
              @endforeach

            </div>
          </div>
        </div>

        <!--------------------------
              Product Content Details
          ---------------------------->
        @php
        $discountAmount = ($product->price - ($product->discount / 100) * $product->price);

        $discount = (($product->discount * 100) / $product->price)
        @endphp

        <div class="col-md-6">
          <div class="product-content">
            <h3 class="title">{{ $product->name }}</h3>
            <p class="summary">{!! Str::limit($product->description, 120) !!}</p>

            @if($product->discount == null )
            <h3 class="price">SA {{ number_format($product->price, 2) }}</h3>
            @endif

            @if($product->discount !== null && $product->discount_type == 'Flat')
            <h3 class="price" data-price="{{ $product->price - $product->discount }}">SA {{
              number_format($product->price -
              $product->discount, 2) }}</h3>

            <p class="previous-price">SA <span class="old-price">{{ number_format($product->price, 2) }}</span> <span
                class="discount">OFF {{ number_format($product->discount, 2) }} SAR</span>
            </p>
            @endif

            @if($product->discount !== null && $product->discount_type == 'Percent')
            <h3 class="price" data-price="{{ $discountAmount }}">SA {{ number_format($discountAmount, 2) }}</h3>

            <p class="previous-price">SA <span class="old-price">{{ number_format($product->price, 2) }}</span> <span
                class="discount">OFF {{
                round($product->discount) }}%</span>
            </p>
            @endif

            @if(!empty($colors))
            <div class="product-color">
              <p>Choose Color: </p>
              <select name="color" id="color" class="form-control js-example-basic-multiple">
                @foreach($colors as $item)
                <option value="{{ $item }}">{{
                  strtoupper($item) }}</option>
                @endforeach
              </select>
            </div>
            @endif

            @if(!empty($sizes))
            <div class="product-size">
              <p>Choose Size: </p>

              <select name="size" id="size" class="form-control js-example-basic-multiple">
                @foreach($sizes as $item)
                <option value="{{ $item }}">{{
                  strtoupper($item) }}</option>
                @endforeach
              </select>
            </div>
            @endif

            <p class="category">Vendor Name: {{ $product->user->name }}</p>

            <div class="product-qty mt-5">
              <div class="nice-number">
                <input class="qty-input" type="number" value="1" min="0">
              </div>
              <a href="javascript:void(0)" class="cart-btn" data-productId="{{ $product->id }}">add to cart</a>
              <a href="javascript:void(0)" class="cart-btn-hidden" data-productId="{{ $product->id }}">add to cart</a>
              <a href="" class="add-wishlist"><img src="{{ asset('frontend/assets/') }}/images/heart.png"
                  alt="user-profile"></a>
            </div>

            <p class="category">Category: @foreach($product->productCategory as $category)
              {{ $category->category->name }}
              @if(!$loop->last)
              ,
              @endif
              @endforeach</p>


            <p class="category">Available Quantity: {{ $product->quantity }} {{ $product->unit }}</p>

          </div>
        </div>
      </div>
    </div>
  </section>

  <!--------------------------
        Product Details
    ---------------------------->
  <section id="product-description">
    <div class="container">
      <div class="row">
        <div class="col-12 product-descriptio-title">
          <ul class="nav mb-3 justify-content-center description-head" id="pills-tab" role="tablist">
            <li class="nav-item" role="presentation">
              <a class="nav-link active" id="pills-home-tab" data-bs-toggle="pill" data-bs-target="#pills-home"
                type="button" role="tab" aria-controls="pills-home" aria-selected="true">Product Description</a>
            </li>
            <li class="nav-item" role="presentation">
              <a class="nav-link" id="pills-profile-tab" data-bs-toggle="pill" data-bs-target="#pills-profile"
                type="button" role="tab" aria-controls="pills-profile" aria-selected="false">Product
                Information</a>
            </li>
          </ul>
          <div class="tab-content" id="pills-tabContent">
            <div class="tab-pane show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">{!!
              $product->description !!}</div>
            <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">
              <table class="table table-bordered">
                <tr>
                  <td class="w-25">Product Name</td>
                  <td>
                    <h6>{{ $product->name }}</h6>
                  </td>
                </tr>
                <tr>
                  <td class="w-25">Product Category: </td>
                  <td>
                    <h6>@foreach($product->productCategory as $category)
                      {{ $category->category->name }}
                      @if(!$loop->last)
                      ,
                      @endif
                      @endforeach </h6>
                  </td>
                </tr>
                <tr>
                  <td class="w-25">Product Subcategory: </td>
                  <td>
                    <h6>@foreach($product->productSubcatogory as $subcategory)
                      {{ $subcategory->subcategory->name }}
                      @if(!$loop->last)
                      ,
                      @endif
                      @endforeach </h6>
                  </td>
                </tr>
                <tr>
                  <td class="w-25">Product Price:</td>
                  <td>
                    @if($product->discount == null )
                    <h6 class="price">SA {{ $product->price }}</h6>
                    @endif

                    @if($product->discount !== null && $product->discount_type == 'Flat')
                    <h6>SA {{ $product->price- $product->discount }}</h6>
                    @endif

                    @if($product->discount !== null && $product->discount_type == 'Percent')
                    <h6>SA {{ $product->price- $product->discount }}</h6>
                    @endif
                  </td>
                </tr>
                <tr>
                  <td class="w-25">Discount:</td>
                  <td>
                    <h6>
                      @if($product->discount !== null && ($product->discount_type == 'Flat' || $product->discount_type
                      == 'Percent'))
                      <span class="discount">OFF {{ $product->discount }} SAR</span>
                      @else
                      <span class="discount">Not Available</span>
                      @endif
                    </h6>
                  </td>
                </tr>
                <tr>
                  <td class="w-25">Available Quantity:</td>
                  <td>
                    <h6>{{ $product->quantity }} {{ $product->unit }}</h6>
                  </td>
                </tr>

                <tr>
                  <td class="w-25">Brand Name:</td>
                  <td>{{ $product->brand ? $product->brand->name : 'N/A' }}</td>
                </tr>

                <tr>
                  <td class="w-25">Color(s)</td>
                  <td>
                    {{ implode(', ', $colors) }}
                  </td>
                </tr>
                <tr>
                  <td class="w-25">Size(s)</td>
                  <td>
                    {{ implode(', ', $sizes) }}
                  </td>
                </tr>

              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!--------------------------
        Related Product
    --------------------------->
  <section id="related-category-product">
    <div class="container">
      <h2 class="section-title text-center mb-4">Related Product</h2>

      <div id="product" class="owl-carousel">
        @foreach($reletedProduct as $item)
        @php
        $discountAmount = ($item->price - ($item->discount / 100) * $item->price);

        $discount = (($item->discount * 100) / $item->price)
        @endphp

        <div class="item">
          <div class="releted-product-item">
            <div class="product-img">
              <a class="w-100" href="{{ route('productView', $item->slug) }}"><img class="img-fluid"
                  src="{{ asset('backend/uploads/' . $item->thumbnail) }}" alt="product-img-1"></a>
            </div>

            <div class="p-3">
              <a href="{{ route('productView', $item->slug) }}" class="product-title">{{ Str::limit($item->name, 25)
                }}</a>

              @if($item->discount == null )
              <div class="d-flex justify-content-between align-items-center">
                <h3 class="new-price my-3 text-dark">SA <span> {{ number_format($item->price, 2)}}</span></h3>

                <span class="wishlist"><i class="far fa-heart"></i></span>
              </div>
              @endif

              @if($item->discount !== null && $item->discount_type == 'Flat')
              <h3 class="new-price my-3 text-dark">SA <span class="text-dark">{{ $item->price- $item->discount
                  }}</span></h3>

              <div class="d-flex justify-content-between">
                <div class="off">
                  <span class="old-price text-dark">SA {{ number_format($item->price, 2) }}</span>
                  <span class="discount">SA {{ $item->discount }} OFF</span>
                </div>
                <span class="wishlist"><i class="far fa-heart"></i></span>
              </div>
              @endif

              @if($item->discount !== null && $item->discount_type == 'Percent')
              <h3 class="new-price my-3 text-dark">SA <span class="text-dark">{{ $discountAmount }}</span></h3>

              <div class="d-flex justify-content-between">
                <div class="off">
                  <span class="old-price text-dark">SA {{ number_format($item->price, 2) }}</span>
                  <span class="discount">{{ round($item->discount) }}% OFF</span>
                </div>
                <span class="wishlist"><i class="far fa-heart"></i></span>
              </div>
              @endif
            </div>
          </div>
        </div>
        @endforeach
      </div>


    </div>
  </section>

</main>
@endsection
@section('footer_js')
<!-- Nice Number -->
<script src="{{ asset('/frontend/assets/') }}/js/jquery.nice-number.min.js"></script>
<script src="https://cdn.rawgit.com/igorlino/elevatezoom-plus/1.1.6/src/jquery.ez-plus.js"></script>
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

<script>
  // Actice Attributes

  $(document).ready(function () {
    $('.js-example-basic-multiple').select2();
  });

  $(document).ready(function () {
    $('.cart-btn').on('click', function (e) {
      let selectElementColor = document.querySelector('#color');
      let selectElementSize = document.querySelector('#size');

      e.preventDefault()
      let productId = $(this).attr('data-productId')
      let quantity = $('.qty-input').val()
      let color = selectElementColor.options[selectElementColor.selectedIndex].value;
      let size = selectElementSize.options[selectElementSize.selectedIndex].value;
      let hasColor = document.querySelector("#color");
      let hasSize = document.querySelector("#size");

      if (hasColor && color == undefined) {
        let title = "You have to select a Color !";
        const Toast = Swal.mixin({
          toast: true,
          position: 'top-end',
          icon: 'warning',
          showConfirmButton: false,
          timer: 2000
        })
        Toast.fire({
          type: 'warning',
          title: title,
        })

      } else if (hasSize && size == undefined) {
        let title = "You have to select a Size !";
        const Toast = Swal.mixin({
          toast: true,
          position: 'top-end',
          icon: 'warning',
          showConfirmButton: false,
          timer: 2000
        })
        Toast.fire({
          type: 'warning',
          title: title,
        })
      } else {
        $('.cart-btn').hide()
        $('.cart-btn-hidden').show()
        $.ajaxSetup({
          headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
          }
        })
        $.ajax({
          url: "{{ url('add-to-cart') }}",
          method: 'POST',
          data: {
            'product_id': productId,
            'quantity': quantity,
            'color': color,
            'size': size
          },
          datType: 'json',
          success: function (data) {
            getTotalCart()
            getCart()
            const Toast = Swal.mixin({
              toast: true,
              position: 'top-end',
              icon: 'success',
              showConfirmButton: false,
              timer: 2000
            })
            if ($.isEmptyObject(data.error)) {
              Toast.fire({
                type: 'success',
                title: data,
              })
            }
            $('.cart-btn-hidden').hide()
            $('.cart-btn').show()
          }
        })
      }
    })
  })
</script>
@endsection