<?php

use App\User;
use Illuminate\Database\Seeder;

class UsersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        User::create([
            'name'     => 'Jeymerson Jones',
            'email'    => 'jeymerson@gmail.com',
            'password' => bcrypt('123teste'),
        ]);
    }
}
