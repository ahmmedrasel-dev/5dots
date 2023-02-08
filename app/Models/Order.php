<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;

class Order extends Model
{
  use HasFactory;
  use Notifiable;

  protected $guarded = [];

  public function user()
  {
    return $this->belongsTo(User::class, 'user_id', 'id');
  }

  public function city($id)
  {
    $data = Cities::find($id);
    return $data ? $data->name : 'N/A';
  }

  public function state($id)
  {
    $data = States::find($id);
    return $data ? $data->name : 'N/A';
  }

  public function order_details()
  {
    return $this->hasMany(OrderDetails::class, 'order_id');
  }
}
