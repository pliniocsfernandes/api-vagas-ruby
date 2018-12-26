# README

## Desenvolvimento
O ambiente deve funcionar em macOS e windows caso o docker esteja corretamente configurado, mas foi testado apenas em linux.

### Pré requisitos
- [docker](https://docs.docker.com/install/)
- [docker-compose](https://docs.docker.com/compose/install/)
- As portas `3000` e `15432` devem estar liberadas

### Setup
Para o setup inicial do ambiente docker é necessário rodar os seguintes comandos na pasta raiz do projeto:
```
docker-compose build
docker-compose run web rake db:create
``` 

Depois, para rodar a aplicação basta executar:
```
docker-compose up
```

A aplicação estará disponível em http://127.0.0.1:3000/

O banco de dados estará disponível em:
- host: 127.0.0.1
- port: 15432
- user: postgres
- pass: 

### Utilização
Para utilizar o ambiente no docker, o modo mais fácil é acessar o container para poder rodar comandos:
```
docker-compose exec --user=user web bash
```

## Produção
### Pré requisitos
- Ruby 2.5.3
- Postgres 11.1
