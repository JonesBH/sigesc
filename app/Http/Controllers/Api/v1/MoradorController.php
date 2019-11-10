<?php

namespace App\Http\Controllers\Api\v1;

use App\Http\Controllers\Controller;
use App\Http\Requests\StoreUpdateMoradorFormRequest;
use App\Models\Morador;
use Illuminate\Http\Request;

class MoradorController extends Controller
{

    private $morador;
    private $totalPage = 4;

    public function __construct(Morador $morador)
    {
        $this->morador = $morador;
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $moradores = $this->morador->getResults($request->all(), $this->totalPage); //getResults($request->nome);

        return response()->json($moradores, 200);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreUpdateMoradorFormRequest $request)
    {
        $morador = $this->morador->create($request->all());
        return response()->json($morador, 201);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $morador = $this->morador->with('unidade')->find($id);

        if (!$morador) {
            return response()->json(['error' => 'Não encontrado'], 404);
        }

        return response()->json($morador, 200);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(StoreUpdateMoradorFormRequest $request, $id)
    {
        $morador = $this->morador->find($id);

        if (!$morador) {
            return response()->json(['error' => 'Não encontrado'], 404);
        }

        $morador->update($request->all());

        return response()->json($morador, 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $morador = $this->morador->find($id);

        if (!$morador) {
            return response()->json(['error' => 'Não encontrado'], 404);
        }

        $morador->delete();

        return response()->json(['success' => true], 204);
    }
}
