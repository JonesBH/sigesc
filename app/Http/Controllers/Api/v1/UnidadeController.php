<?php

namespace App\Http\Controllers\Api\v1;

use App\Http\Controllers\Controller;
use App\Http\Requests\StoreUpdateUnidadeFormRequest;
use App\Models\Unidade;
use Illuminate\Http\Request;

class UnidadeController extends Controller
{

    private $unidade;
    private $totalPage = 4;

    public function __construct(Unidade $unidade)
    {
        $this->unidade = $unidade;
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $unidades = $this->unidade->getResults($request->all(), $this->totalPage); //getResults($request->nome);

        return response()->json($unidades, 200);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreUpdateUnidadeFormRequest $request)
    {
        $unidade = $this->unidade->create($request->all());
        return response()->json($unidade, 201);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $unidade = $this->unidade->with('condominio')->find($id);

        if (!$unidade) {
            return response()->json(['error' => 'Não encontrado'], 404);
        }

        return response()->json($unidade, 200);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(StoreUpdateUnidadeFormRequest $request, $id)
    {
        $unidade = $this->unidade->find($id);

        if (!$unidade) {
            return response()->json(['error' => 'Não encontrado'], 404);
        }

        $unidade->update($request->all());

        return response()->json($unidade, 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $unidade = $this->unidade->find($id);

        if (!$unidade) {
            return response()->json(['error' => 'Não encontrado'], 404);
        }

        $unidade->delete();

        return response()->json(['success' => true], 204);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */

    public function moradores($id)
    {
        $unidade = $this->unidade->find($id);

        if (!$unidade) {
            return response()->json(['error' => 'Não encontrado'], 404);
        }

        $moradores = $unidade->morador()->paginate($this->totalPage);

        return response()->json([
            'unidades'  => $unidade,
            'moradores' => $moradores,
        ], 200);
    }

    public function despesa(Request $request, $id)
    {

        if (!isset($request->valor)) {
            return response()->json(['error' => 'Valor não informado'], 422);
        }

        $valor = $request->valor;

        if (isset($request->bloco)) {
            $bloco = $request->bloco;
        }

        $unidades = $this->unidade->where('condominio_id', $id)->count();
        if (!$unidades) {
            return response()->json(['error' => 'Não encontrado'], 404);
        }

        $unidades = $this->unidade->with('morador')->where(function ($query) {
            if (isset($bloco)) {
                $query->where('bloco', $bloco);
            }
        })->get()->toArray();

        $soma = array_sum(array_column($unidades, 'area'));

        $unidades = array_map(function ($arr) use ($soma, $valor) {
            $fracao         = ($arr['area'] / $soma);
            $despesa        = ($valor * $fracao);
            $arr['despesa'] = $despesa;
            return $arr;
        }, $unidades);

        return response()->json($unidades, 200);
    }
}
