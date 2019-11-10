<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Unidade extends Model
{
    protected $fillable = [
        'condominio_id',
        'bloco',
        'area',
        'numero',
    ];

    public function getResults($data, $total)
    {

        if (!isset($data['filter']) && !isset($data['bloco']) && !isset($data['numero'])) {
            return $this->paginate($total);
        }

        return $this->where(function ($query) use ($data) {
            if (isset($data['filter'])) {
                $filter = $data['filter'];
                $query->where('bloco', $filter);
                $query->orWhere('numero', $filter);
            }

            if (isset($data['bloco'])) {
                $query->where('bloco', $data['bloco']);
            }

            if (isset($data['numero'])) {
                $query->where('numero', $data['numero']);
            }
        })->paginate($total);
    }

    public function condominio()
    {
        return $this->belongsTo(Unidade::class);
    }

    public function morador()
    {
        return $this->hasMany(Morador::class);
    }
}
