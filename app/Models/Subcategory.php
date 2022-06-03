<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Subcategory extends Model
{
  use HasFactory;

  function category()
  {
    return $this->belongsTo(Category::class, 'category_id');
  }

  public function products()
  {
    return $this->hasMany(Product::class, 'sub_category_id', 'id');
  }
}
