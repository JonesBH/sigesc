<?php

use App\Models\Condominio;
use Illuminate\Database\Seeder;

class CondominiosTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Condominio::create([
            'nome'        => 'Edifício Itatiaia',
            'logradouro'  => 'Rua Carlos Campos Motta',
            'numero'      => '223',
            'complemento' => '',
            'bairro'      => 'Itatiaia',
            'cidade'      => 'Belo Horizonte',
            'estado'      => 'MG',
            'cep'         => '31360660',
        ]);
    }
}
