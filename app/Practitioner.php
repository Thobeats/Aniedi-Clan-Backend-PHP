<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Practitioner extends Model
{
    protected $table = 'staff';

    public function practitioner()
    {
        return $this->belongsTo('App\Practitioner');
    }

    public function user()
    {
        return $this->belongsTo('App\User');
    }
    public function hospital()
    {
        // return $this->belongsTo(User::class);
        return $this->belongsTo('App\Hospital');
    }
}
