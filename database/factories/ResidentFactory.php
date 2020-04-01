<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Resident;
use Faker\Generator as Faker;

$factory->define(Resident::class, function (Faker $faker) {
    return [
        'resident' => $faker->streetAddress(),
        'name' => $faker->name(),
        'email' => $faker->email()
    ];
});
