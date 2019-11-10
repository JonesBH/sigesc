# Sigesc

Api para calculo de despesa de Condominio com autenticação JWT

## Sobre

- Implementada em Laravel 5.5 (versão lts) 
- Aplicando conceitos de:
   - MVC
   - Middlewares
   - Cors
   - Migrations
   - Seeders
   - Factories

## Instalação

Execute na raiz do projeto sigesc para baixar todas as dependências do projeto


```sh
$ composer install
```

Edite renomeie **.env.example** para **.env** e configure

## Cliente Rest e Banco de Dados

**Para testes**

Importe o arquivo [insomnia_sigesc.json](https://github.com/JonesBH/sigesc/blob/master/insomnia_sigesc.json) no [Insomnia](https://insomnia.rest/download/) -> https://insomnia.rest/download/

Arquivo sql (MariaDB) [sigesc.sql](https://github.com/JonesBH/sigesc/blob/master/sigesc.sql)

> Lembre de configurar o banco no arquivo *.env*

## Uso

**URL's Bases** \
[Autenticação](http://sigesc.onedevs.com.br/api/v1/) http://sigesc.onedevs.com.br/api/v1/ \

[Chamadas](http://sigesc.onedevs.com.br/api/)  http://sigesc.onedevs.com.br/api/

*Usuário(email):* jeymerson@gmail.com\
*Senha(password):* 123teste 


## Licença
[Apache](http://escolhaumalicenca.com.br/licencas/apache/)
