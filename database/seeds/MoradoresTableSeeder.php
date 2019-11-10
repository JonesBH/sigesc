<?php

use App\Models\Morador;
use Illuminate\Database\Seeder;

class MoradoresTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        factory(Morador::class, 16)->create();
    }
}
