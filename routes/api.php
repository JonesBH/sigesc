<?php

$this->post('auth', 'Auth\AuthApiController@authenticate');
$this->post('auth-refresh', 'Auth\AuthApiController@refreshToken');
$this->get('user', 'Auth\AuthApiController@getAuthenticatedUser');

$this->group([
    'prefix'     => 'v1',
    'namespace'  => 'Api\v1',
    'middleware' => 'auth:api',
], function () {
    $this->get('condominios/{id}/unidades', 'CondominioController@unidades');
    $this->get('unidades/{id}/moradores', 'UnidadeController@moradores');

    $this->post('despesas/{id}', 'UnidadeController@despesa');

    $this->apiResource('condominios', 'CondominioController');
    $this->apiResource('unidades', 'UnidadeController');
    $this->apiResource('moradores', 'MoradorController');
});
