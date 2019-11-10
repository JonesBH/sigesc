<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Condominio extends Model
{

    protected $fillable = [
        'nome',
        'logradouro',
        'numero',
        'complemento',
        'bairro',
        'cidade',
        'estado',
        'cep',
    ];

    public function getResults($nome = null)
    {
        if (!$nome) {
            return $this->get();
        } else {
            return $this->where('nome', 'LIKE', "%{$nome}%")
                ->get();
        }
    }

    public function unidade()
    {
        return $this->hasMany(Unidade::class);
    }
}
