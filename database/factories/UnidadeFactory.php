<?php

use App\Models\Unidade;
use Faker\Generator as Faker;

$factory->define(Unidade::class, function (Faker $faker) {
    return [
        'condominio_id' => 1,
        'numero'        => $faker->randomNumber,
    ];
});
