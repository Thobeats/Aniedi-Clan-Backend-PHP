<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Patients extends Model
{
    protected $table = 'patient';

    public function patient()
    {
        return $this->belongsTo('App\Patient');
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
