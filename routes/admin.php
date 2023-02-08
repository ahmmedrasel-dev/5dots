<?php

use Illuminate\Support\Facades\Route;

use App\Http\Controllers\Backend\CategoryController;
use App\Http\Controllers\Backend\CouponController;
use App\Http\Controllers\Backend\CustomerController;
use App\Http\Controllers\Backend\DashboardController;
use App\Http\Controllers\Backend\MailboxController;
use App\Http\Controllers\Backend\ProductController;
use App\Http\Controllers\Backend\SellerController;
use App\Http\Controllers\Backend\GeneralSettingController;
use App\Http\Controllers\Backend\SubcategoryController;
use App\Http\Controllers\Backend\AttributesController;
use App\Http\Controllers\Backend\BannerController;
use App\Http\Controllers\Backend\SliderController;
use App\Http\Controllers\Backend\ShopController;

Route::group(['prefix' => 'admin', 'middleware' => ['auth', 'verified', 'admin']], function () {

  Route::get('/dashboard', [DashboardController::class, 'dashboard']); // Not Done

  Route::resources([
    'category' => CategoryController::class,
    'subcategory' => SubcategoryController::class,
    'product' => ProductController::class,
    'coupon' => CouponController::class,
    'attributes' => AttributesController::class
  ]);

  # Shop
  Route::get('/shop/{shop}', [ShopController::class, 'statusChange']);

  Route::get('notification-read/{id}', [DashboardController::class, 'notificationRead'])->name('markAsRead');
  # Product
  Route::get('product/delete/{product}', [ProductController::class, 'destroy']);
  Route::get('product/image/delete/{image}', [ProductController::class, 'destroyImage']);
  Route::get('product-draft', [ProductController::class, 'productDraft'])->name('productDraft');
  Route::get('orders', [DashboardController::class, 'orderList'])->name('orderList');
  Route::get('order/{id}', [DashboardController::class, 'show'])->name('show');

  # Update status
  Route::get('order/{order}/update/{status}', [DashboardController::class, 'updateStatus']);

  # Withdraw System
  Route::get('withdraw/{id}', [SellerController::class, 'show'])->name('show');
  

  Route::get('withdraw', [SellerController::class, 'paymentWithdraw'])->name('paymentWithdraw'); 
  Route::get('withdraw/{withdraw}/update/{status}', [SellerController::class, 'updateStatus']);
  // Seller
  Route::get('seller-list', [SellerController::class, 'sellerList'])->name('sellerList');
  Route::get('seller/{id}', [SellerController::class, 'sellerShow'])->name('sellerShow');
  Route::get('sendAlert/{id}', [SellerController::class, 'sendAlert'])->name('sendAlert');


  // Customer
  Route::get('customer-list', [CustomerController::class, 'customerList'])->name('customerList');
  Route::get('customer/{id}', [CustomerController::class, 'customerShow'])->name('customerShow');

  // Mailbox
  Route::get('mail', [MailboxController::class, 'mailbox'])->name('mailbox');
  Route::get('compose', [MailboxController::class, 'compose'])->name('compose');

  // Settings
  Route::get('settings', [GeneralSettingController::class, 'settings'])->name('settings');
  Route::post('settings-update', [GeneralSettingController::class, 'update'])->name('settings.update');
  Route::post('settings-seo-update', [GeneralSettingController::class, 'seoUpdate'])->name('settings.seo.update');
  Route::post('settings-mail-update', [GeneralSettingController::class, 'mailUpdate'])->name('settings.mail.update');
  Route::post('settings-social-update', [GeneralSettingController::class, 'socialUpdate'])->name('settings.social.update');
  Route::post('settings-payment-update', [GeneralSettingController::class, 'updatePayment'])->name('settings.payment.update');

  // Slider
  Route::get('/sliders', [SliderController::class, 'index'])->name('sliderList');
  Route::get('/sliders/create', [SliderController::class, 'create'])->name('sliderCreate');
  Route::post('/sliders/store', [SliderController::class, 'store'])->name('sliderStore');
  Route::get('/sliders/edit/{slider}', [SliderController::class, 'edit'])->name('sliderEdit');
  Route::patch('/sliders/update/{slider}', [SliderController::class, 'update'])->name('sliderUpdate');
  Route::get('/sliders/destroy/{slider}', [SliderController::class, 'destroy'])->name('sliderDestroy');
  Route::get('/sliders/status/{slider}', [SliderController::class, 'statusChange'])->name('sliderStatus');

  // Banner
  Route::get('/banner', [BannerController::class, 'banner'])->name('banner');
  Route::put('/banner-update-one', [BannerController::class, 'bannerOne'])->name('banner.update.one');
  Route::put('/banner-update-two', [BannerController::class, 'bannerTwo'])->name('banner.update.two');
  Route::put('/banner-update-three', [BannerController::class, 'bannerThree'])->name('banner.update.three');
});
