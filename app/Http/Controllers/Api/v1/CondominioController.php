<?php

namespace App\Http\Controllers\Api\v1;

use App\Http\Controllers\Controller;
use App\Http\Requests\StoreUpdateCondominioFormRequest;
use App\Models\Condominio;
use Illuminate\Http\Request;

class CondominioController extends Controller
{

    private $condominio;
    private $totalPage = 4;

    public function __construct(Condominio $condominio)
    {
        $this->condominio = $condominio;
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $condominios = $this->condominio->getResults($request->nome);

        return response()->json($condominios, 200);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreUpdateCondominioFormRequest $request)
    {
        $condominio = $this->condominio->create($request->all());
        return response()->json($condominio, 201);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $condominio = $this->condominio->find($id);

        if (!$condominio) {
            return response()->json(['error' => 'Não encontrado'], 404);
        }

        return response()->json($condominio, 200);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(StoreUpdateCondominioFormRequest $request, $id)
    {
        $condominio = $this->condominio->find($id);

        if (!$condominio) {
            return response()->json(['error' => 'Não encontrado'], 404);
        }

        $condominio->update($request->all());

        return response()->json($condominio, 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $condominio = $this->condominio->find($id);

        if (!$condominio) {
            return response()->json(['error' => 'Não encontrado'], 404);
        }

        $condominio->delete();

        return response()->json(['success' => true], 204);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */

    public function unidades($id)
    {
        $condominio = $this->condominio->find($id);

        if (!$condominio) {
            return response()->json(['error' => 'Não encontrado'], 404);
        }

        $unidades = $condominio->unidade()->paginate($this->totalPage);

        return response()->json([
            'condominios' => $condominio,
            'unidades'    => $unidades,
        ], 200);
    }
}
