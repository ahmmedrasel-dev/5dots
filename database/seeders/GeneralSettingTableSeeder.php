<?php

namespace Database\Seeders;

use App\Models\GeneralSetting;
use Illuminate\Database\Seeder;

class GeneralSettingTableSeeder extends Seeder
{
  /**
   * Run the database seeds.
   *
   * @return void
   */
  public function run()
  {
    GeneralSetting::create([
      'app_name' => '5dots',
      'app_logo_white' => '',
      'app_logo_black' => '',
      'app_phone' => '0534588012',
      'shipping_cost' => 30,
      'shipping_days' => 7,
      'app_email' => 'info@5dots.sa',
      'app_address' => 'Al-Khobar',
      'app_copyright_text' => 'Copyright © 2022 [5dots.sa] All rights reserved.',
      'seo_title' => '5dots',
      'seo_description' => '5dots Ecommerce',
      'seo_keywords' => '5dots, Ecommerce',
      'mail_type' => 'smtp',
      'mail_host' => '5dots.sa',
      'mail_port' => '465',
      'mail_username' => 'support@5dots.sa',
      'mail_password' => 'Pt!bPT{fJ1UC',
      'mail_encryption' => 'ssl',
      'mail_address' => 'support@5dots.sa',
      'mail_from_name' => '5dots',
      'app_id' => 'app-id',
      'app_secret' => 'app-secret'
    ]);
  }
}
