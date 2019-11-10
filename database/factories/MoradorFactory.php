<?php

use App\Models\Morador;
use Faker\Generator as Faker;

$factory->define(Morador::class, function (Faker $faker) {
    return [
        'unidade_id' => 1,
        'nome'       => $faker->unique()->word,
    ];
});
