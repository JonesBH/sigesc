<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Morador extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'moradores';

    protected $fillable = [
        'unidade_id',
        'nome',
    ];

    public function getResults($data, $total)
    {

        if (!isset($data['filter']) && !isset($data['nome'])) {
            return $this->paginate($total);
        }

        return $this->where(function ($query) use ($data) {
            if (isset($data['filter'])) {
                $filter = $data['filter'];
                $query->where('nome', 'LIKE', "%{$filter}%");
            }

            if (isset($data['nome'])) {
                $query->where('nome', 'LIKE', "%{$nome}%");}
        })->paginate($total);
    }

    public function unidade()
    {
        return $this->belongsTo(Morador::class);
    }
}
