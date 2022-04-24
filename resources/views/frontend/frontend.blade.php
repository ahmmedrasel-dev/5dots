@extends('frontend.master')
@section('content')
<main>
  <!---------------------------
            Slider Start Here 
      ----------------------------->
  <section id="showcase" class="bg-dark">
    <div id="myCarousel" class="carousel carousel-dark slide" data-bs-ride="carousel">
      <ol class="carousel-indicators">
        <li data-bs-slide-to="0" data-bs-target="#myCarousel" class="active"></li>
        <li data-bs-slide-to="1" data-bs-target="#myCarousel"></li>
        <li data-bs-slide-to="2" data-bs-target="#myCarousel"></li>
      </ol>
      <div class="carousel-inner">
        <div class="carousel-item carousel-img-1 active" data-bs-interval="3000">
          <div class="container">
            <div class="carousel-caption text-dark text-left">
              <div class="carousel-text">
                <p class="wow bounceInDown" data-wow-duration="1s" data-wow-delay="0s">50% off in all products</p>
                <h1 class=" wow bounceInDown" data-wow-duration="1.2s" data-wow-delay=".2s">office furniture</h1>
                <a class="btn fivedots-btn wow bounceInDown" data-wow-duration="1.5s" data-wow-delay=".5s" href="#">Shop
                  Now <img class="icon" src="{{ asset('frontend/assets') }}/images/btn-arrow-light.png" alt=""></a>
              </div>
            </div>
          </div>
        </div>
        <div class="carousel-item carousel-img-2" data-bs-interval="3000">
          <div class="container">
            <div class="container">
              <div class="carousel-caption text-dark text-left">
                <div class="carousel-text">
                  <p class="wow bounceInDown" data-wow-duration="1s" data-wow-delay="0s">50% off in all products</p>
                  <h1 class=" wow bounceInDown" data-wow-duration="1.2s" data-wow-delay=".2s">office furnicture</h1>
                  <a class="btn fivedots-btn wow bounceInDown" data-wow-duration="1.5s" data-wow-delay=".5s"
                    href="#">Shop Now <img class="icon" src="{{ asset('frontend/assets') }}/images/btn-arrow-light.png"
                      alt=""></a>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="carousel-item carousel-img-3" data-bs-interval="3000">
          <div class="container">
            <div class="carousel-caption text-dark text-left">
              <div class="carousel-text">
                <p class="wow bounceInDown" data-wow-duration="1s" data-wow-delay="0s">50% off in all products</p>
                <h1 class=" wow bounceInDown" data-wow-duration="1.2s" data-wow-delay=".2s">office furniture</h1>
                <a class="btn fivedots-btn wow bounceInDown" data-wow-duration="1.5s" data-wow-delay=".5s" href="#">Shop
                  Now <img class="icon" src="{{ asset('frontend/assets') }}/images/btn-arrow-light.png" alt=""></a>
              </div>
            </div>
          </div>
        </div>
      </div>
      <a href="#myCarousel" class="carousel-control-prev" data-bs-slide="prev">
        <span class="carousel-control-prev-icon"></span>
      </a>
      <a href="#myCarousel" class="carousel-control-next" data-bs-slide="next">
        <span class="carousel-control-next-icon"></span>
      </a>
    </div>
  </section>

  <!---------------------------
            Womans Category Start 
      ----------------------------->
  <section id="womens-category">
    <div class="container">
      <div class="row">
        <div class="col-md-3 child-category">
          <div class="child-cat-item ">
            <a href="pages/categorie-shop.html"><img class="w-100"
                src="{{ asset('frontend/assets') }}/images/womens-1.png" alt="womens-1"></a>
            <h3>Women's Clothes</h3>
            <a class="explore-btn" href="pages/categorie-shop.html">Explore <img class="icon"
                src="{{ asset('frontend/assets') }}/images/btn-arrow.png" alt=""></a>
          </div>

          <div class="child-cat-item">
            <a href="pages/categorie-shop.html"><img class="w-100"
                src="{{ asset('frontend/assets') }}/images/womens-2.png" alt="womens-1"></a>
            <h3>Women's Watches</h3>
            <a class="explore-btn" href="pages/categorie-shop.html">Explore <img class="icon"
                src="{{ asset('frontend/assets') }}/images/btn-arrow.png" alt=""></a>
          </div>

        </div>

        <div class="col-md-6 category-main">
          <div class="parent-cat-item">
            <div class="overflow"></div>
            <img class="img-fluid" src="{{ asset('frontend/assets') }}/images/womens-main-1.jpeg" alt="women's Main">
            <div class="parent-cat-content">
              <h4>Weekend Sale</h4>
              <h2>New Fashion Collection</h2>
              <p>From only $180.00</p>
              <a class="fivedots-btn mt-4" href="#">Shop Now <img class="icon"
                  src="{{ asset('frontend/assets') }}/images/btn-arrow-light.png" alt=""></a>
            </div>
          </div>
        </div>

        <div class="col-md-3 child-category">
          <div class="child-cat-item">
            <a href="pages/categorie-shop.html"><img class="w-100"
                src="{{ asset('frontend/assets') }}/images/womens-3.png" alt="womans-1"></a>
            <h3>Footwear</h3>
            <a class="explore-btn" href="pages/categorie-shop.html">Explore <img class="icon"
                src="{{ asset('frontend/assets') }}/images/btn-arrow.png" alt=""></a>
          </div>

          <div class="child-cat-item mt-2">
            <a href="pages/categorie-shop.html"><img class="w-100"
                src="{{ asset('frontend/assets') }}/images/womens-4.png" alt="womans-1"></a>
            <h3>Sportswear</h3>
            <a class="explore-btn" href="pages/categorie-shop.html">Explore <img class="icon"
                src="{{ asset('frontend/assets') }}/images/btn-arrow.png" alt=""></a>
          </div>
        </div>

      </div>
    </div>
  </section>

  <!---------------------------
          Banner Section One 
      ----------------------------->
  <section id="banner-one">
    <div class="conteiner">
      <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12">
          <div class="banner-content">
            <h5 class="banner-sub-heading">20% off in all Products</h5>
            <h3 class="banner-heading">Mens Special</h3>
            <a class="fivedots-btn" href="">Shop Now <img class="icon"
                src="{{ asset('frontend/assets') }}/images/btn-arrow-light.png" alt=""></a>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!---------------------------
          Mens Category Start 
      ----------------------------->
  <section id="mens-category" class="container">
    <div class="row">
      <div class="col-md-3 child-category">
        <div class="child-cat-item">
          <a href="pages/categorie-shop.html"><img class="img-fluid"
              src="{{ asset('frontend/assets') }}/images/mens-1.png" alt="women's-1"></a>
          <h3>Mens Clothes</h3>
          <a class="explore-btn" href="pages/categorie-shop.html">Explore <img class="icon"
              src="{{ asset('frontend/assets') }}/images/btn-arrow.png" alt=""></a>
        </div>

        <div class="child-cat-item text-center mt-2">
          <a href="pages/categorie-shop.html"><img class="img-fluid"
              src="{{ asset('frontend/assets') }}/images/mens-2.png" alt="women's-1"></a>
          <h3>Mens Footwear</h3>
          <a class="explore-btn" href="pages/categorie-shop.html">Explore <img class="icon"
              src="{{ asset('frontend/assets') }}/images/btn-arrow.png" alt=""></a>
        </div>

      </div>

      <div class="col-md-3 child-category">
        <div class="child-cat-item">
          <a href="pages/categorie-shop.html"><img class="img-fluid"
              src="{{ asset('frontend/assets') }}/images/mens-3.png" alt="women's-1"></a>
          <h3>Mens Watches</h3>
          <a class="explore-btn" href="pages/categorie-shop.html">Explore <img class="icon"
              src="{{ asset('frontend/assets') }}/images/btn-arrow.png" alt=""></a>
        </div>

        <div class="child-cat-item mt-2">
          <a href="pages/categorie-shop.html"><img class="img-fluid"
              src="{{ asset('frontend/assets') }}/images/mens-4.png" alt="women's-1"></a>
          <h3>Mens Sportswear</h3>
          <a class="explore-btn" href="pages/categorie-shop.html">Explore <img class="icon"
              src="{{ asset('frontend/assets') }}/images/btn-arrow.png" alt=""></a>
        </div>
      </div>

      <div class="col-md-6 category-main">
        <div class="parent-cat-item">
          <div class="overflow"></div>
          <img class="img-fluid parent-cat-banner" src="{{ asset('frontend/assets') }}/images/mens-main-1.png"
            alt="women's Main">
          <div class="parent-cat-content">
            <h4>Weekend Sale</h4>
            <h2>New Fashion Collection</h2>
            <p>From only $180.00</p>
            <a class="fivedots-btn mt-4" href="#">Shop Now <img class="icon"
                src="{{ asset('frontend/assets') }}/images/btn-arrow-light.png" alt=""></a>
          </div>
        </div>
      </div>

    </div>
  </section>

  <!---------------------------
                Banner Two 
      ---------------------------->
  <section id="banner-two">
    <div class="conteiner">
      <div class="row">
        <div class="col-6"></div>
        <div class="col-6">
          <div class="banner-content bc-two">
            <h3 class="banner-heading">Ready For the Summer</h3>
            <a class="fivedots-btn" href="#">Shop Now <img class="icon"
                src="{{ asset('frontend/assets') }}/images/btn-arrow-light.png" alt=""></a>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!--------------------------------
            Accessories Category Start 
      --------------------------------->
  <section id="accessories-category">
    <div class="container">
      <div class="row">
        <div class="col-md-6 category-main">
          <div class="parent-cat-item">
            <div class="overflow"></div>
            <img class="img-fluid parent-cat-banner" src="{{ asset('frontend/assets') }}/images/Accesories-main-1.png"
              alt="women's Main">
            <div class="parent-cat-content">
              <h4>Weekend Sale</h4>
              <h2>New Fashion Collection</h2>
              <p>From only $180.00</p>
              <a class="fivedots-btn mt-4" href="#">Shop Now <img class="icon"
                  src="{{ asset('frontend/assets') }}/images/btn-arrow-light.png" alt=""></a>
            </div>
          </div>
        </div>

        <div class="col-md-3 child-category">
          <div class="child-cat-item">
            <a href="pages/categorie-shop.html"><img class="img-fluid"
                src="{{ asset('frontend/assets') }}/images/accesories-1.png" alt="womens-1"></a>
            <h3>Begs</h3>
            <a class="explore-btn" href="pages/categorie-shop.html">Explore <img class="icon"
                src="{{ asset('frontend/assets') }}/images/btn-arrow.png" alt=""></a>
          </div>

          <div class="child-cat-item mt-2">
            <a href="pages/categorie-shop.html"><img class="img-fluid"
                src="{{ asset('frontend/assets') }}/images/accesories-2.png" alt="womens-1"></a>
            <h3>Perfumes</h3>
            <a class="explore-btn" href="pages/categorie-shop.html">Explore <img class="icon"
                src="{{ asset('frontend/assets') }}/images/btn-arrow.png" alt=""></a>
          </div>

        </div>

        <div class="col-md-3 child-category">
          <div class="child-cat-item">
            <a href="pages/categorie-shop.html"><img class="img-fluid"
                src="{{ asset('frontend/assets') }}/images/accesories-3.png" alt="womens-1"></a>
            <h3>Makeups</h3>
            <a class="explore-btn" href="pages/categorie-shop.html">Explore <img class="icon"
                src="{{ asset('frontend/assets') }}/images/btn-arrow.png" alt=""></a>
          </div>

          <div class="child-cat-item mt-2">
            <a href="pages/categorie-shop.html"><img class="img-fluid"
                src="{{ asset('frontend/assets') }}/images/accesories-4.png" alt="womens-1"></a>
            <h3>Jewellary</h3>
            <a class="explore-btn" href="pages/categorie-shop.html">Explore <img class="icon"
                src="{{ asset('frontend/assets') }}/images/btn-arrow.png" alt=""></a>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!---------------------------------
            Product BY Category one 
      ---------------------------------->
  <section id="product-category-men">
    <div class="container">
      <h2 class="section-title text-center text-white mb-md-4">styles based on your shopping habits</h2>
      <div id="product" class="owl-carousel">
        <div class="item">
          <div class="product-item">
            <a class="w-100" href="pages/product-details.html"><img class="img-fluid"
                src="{{ asset('frontend/assets') }}/images/product-img-1.png" alt="product-img-1"></a>

            <div class="product-content">
              <a href="pages/product-details.html" class="product-title-home">Black Snikers shoes</a>
              <h3 class="new-price my-3">SAR <span>230.00</span></h3>
              <div class="d-flex justify-content-between">
                <div class="off">
                  <span class="old-price">SAR 340</span>
                  <span class="discount">30% OFF</span>
                </div>
                <span class="wishlist"><i class="far fa-heart"></i></span>
              </div>
            </div>
          </div>
        </div class="item">

        <div class="item">
          <div class="product-item">
            <a class="w-100" href="pages/product-details.html"><img class="img-fluid"
                src="{{ asset('frontend/assets') }}/images/product-img-2.png" alt="product-img-1"></a>

            <div class="product-content">
              <a href="pages/product-details.html" class="product-title-home">Womens Fahsion Clothes</a>
              <h3 class="new-price my-3">SAR <span>230.00</span></h3>
              <div class="d-flex justify-content-between">
                <div class="off">
                  <span class="old-price">SAR 340</span>
                  <span class="discount">30% OFF</span>
                </div>
                <span class="wishlist"><i class="far fa-heart"></i></span>
              </div>
            </div>
          </div>
        </div>

        <div class="item">
          <div class="product-item">
            <a class="w-100" href="pages/product-details.html"><img class="img-fluid"
                src="{{ asset('frontend/assets') }}/images/product-img-3.png" alt="product-img-1"></a>

            <div class="product-content">
              <a href="pages/product-details.html" class="product-title-home">Black causal boat shoes</a>
              <h3 class="new-price my-3">SAR <span>230.00</span></h3>
              <div class="d-flex justify-content-between">
                <div class="off">
                  <span class="old-price">SAR 340</span>
                  <span class="discount">30% OFF</span>
                </div>
                <span class="wishlist"><i class="far fa-heart"></i></span>
              </div>
            </div>
          </div>
        </div>

        <div class="item">
          <div class="product-item">
            <a class="w-100" href="pages/product-details.html"><img class="img-fluid"
                src="{{ asset('frontend/assets') }}/images/product-img-4.png" alt="product-img-1"></a>

            <div class="product-content">
              <a href="pages/product-details.html" class="product-title-home">Color convers shoes</a>
              <h3 class="new-price my-3">SAR <span>230.00</span></h3>
              <div class="d-flex justify-content-between">
                <div class="off">
                  <span class="old-price">SAR 340</span>
                  <span class="discount">30% OFF</span>
                </div>
                <span class="wishlist"><i class="far fa-heart"></i></span>
              </div>
            </div>
          </div>
        </div>

        <div class="item">
          <div class="product-item">
            <a class="w-100" href="pages/product-details.html"><img class="img-fluid"
                src="{{ asset('frontend/assets') }}/images/product-img-4.png" alt="product-img-1"></a>

            <div class="product-content">
              <a href="pages/product-details.html" class="product-title-home">Color convers shoes</a>
              <h3 class="new-price my-3">SAR <span>230.00</span></h3>
              <div class="d-flex justify-content-between">
                <div class="off">
                  <span class="old-price">SAR 340</span>
                  <span class="discount">30% OFF</span>
                </div>
                <span class="wishlist"><i class="far fa-heart"></i></span>
              </div>
            </div>
          </div>
        </div>

        <div class="item">
          <div class="product-item">
            <a class="w-100" href="pages/product-details.html"><img class="img-fluid"
                src="{{ asset('frontend/assets') }}/images/product-img-4.png" alt="product-img-1"></a>

            <div class="product-content">
              <a href="pages/product-details.html" class="product-title-home">Color convers shoes</a>
              <h3 class="new-price my-3">SAR <span>230.00</span></h3>
              <div class="d-flex justify-content-between">
                <div class="off">
                  <span class="old-price">SAR 340</span>
                  <span class="discount">30% OFF</span>
                </div>
                <span class="wishlist"><i class="far fa-heart"></i></span>
              </div>
            </div>
          </div>
        </div>

      </div>

      <div class="text-center mt-4">
        <a class="fivedots-btn" href="#">View More <img class="icon"
            src="{{ asset('frontend/assets') }}/images/btn-arrow-light.png" alt=""></a>
      </div>
    </div>
  </section>

  <!--------------------------------
            Banner Section Three
      --------------------------------->
  <section id="banner-three">
    <div class="conteiner">
      <div class="row">
        <div class="col-6">
          <div class="banner-content">
            <h3 class="banner-heading">35% <span class="d-block">Discount On All Items</span></h3>
            <a class="fivedots-btn" href="#">Shop Now <img class="icon"
                src="{{ asset('frontend/assets') }}/images/btn-arrow-light.png" alt=""></a>
          </div>
        </div>
        <div class="col-6">
        </div>
      </div>
    </div>
  </section>

  <!-------------------------------
            Product BY Brand
      -------------------------------->
  <section id="product-category-men">
    <div class="container">
      <div class="row">
        <h2 class="section-title text-center text-white mb-3">Shop By Brand</h2>
        <div class="col-md-12">
          <div id="brand" class="owl-carousel">
            <div class="items"><a href="#"><img src="{{ asset('frontend/assets') }}/images/brand-logo/calvin-klein.jpeg"
                  alt=""></a></div>
            <div class="items"><a href="#"><img src="{{ asset('frontend/assets') }}/images/brand-logo/Adidas.jpeg"
                  alt=""></a></div>
            <div class="items"><a href="#"><img src="{{ asset('frontend/assets') }}/images/brand-logo/calvin-klein.jpeg"
                  alt=""></a></div>
            <div class="items"><a href="#"><img src="{{ asset('frontend/assets') }}/images/brand-logo/gues.jpeg"
                  alt=""></a></div>
            <div class="items"><a href="#"><img src="{{ asset('frontend/assets') }}/images/brand-logo/new-balance.jpeg"
                  alt=""></a></div>
            <div class="items"><a href="#"><img src="{{ asset('frontend/assets') }}/images/brand-logo/skechers.jpeg"
                  alt=""></a></div>
          </div>
        </div>

      </div>
    </div>
  </section>

  <!------------------------------- 
          Subscription Section
      -------------------------------->
  <section id="subscription">
    <div class="container">
      <div class="row">
        <div class="col-md-10 offset-md-1 col-12">
          <div class="row align-items-center">
            <div class="col-md-7">
              <div class="subscribe-content">
                <h2>Get your update news</h2>
                <p>If you are going to use a passage of Lorem Ipsum, you need to <br>be sure there isn't anything
                  embarrassing.</p>
              </div>
            </div>
            <div class="col-md-5">
              <form action="" class="subscribe-from">
                <div class="input-group">
                  <input class="form-control subscribe-input" type="email" placeholder="Put Your Email">
                  <button class="subscribe-btn" type="submit">Subscribe</button>
                </div>
              </form>

            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</main>
@endsection