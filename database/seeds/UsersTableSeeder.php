<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class UsersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('users')->insert([
        	'role_id' => '1',
        	'name' => 'Md Sanowar Hossen',
        	'user_name' => 'sanowar',
        	'email' => 'sanowargiit22@gmail.com',
        	'password' => bcrypt('sanowarseema'),

        ]);

        DB::table('users')->insert([
        	'role_id' => '2',
        	'name' => 'Author',
        	'user_name' => 'author',
        	'email' => 'author@gmail.com',
        	'password' => bcrypt('author'),
        ]);
    }
}
