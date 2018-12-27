# README

A solução utiliza a linguagem Ruby e o framework Rails no modo API para implementar o desafio.  
A aplicação está configurada para utilizar um banco de dados Postgres, mas não há nada específico do banco, pois toda a aplicação é gerenciada pela ORM do Rails.  
Algumas configurações das considerações gerais foram colocadas em banco de dados para facilitar a evolução da aplicação ou a utilização com um cenário diferente.  
Inicialmente tanto os níveis de experiência quanto as localidades e o mapa ficariam no banco de dados, porém a parte de nível de experiência foi deixada sem mapeamento, pois os endpoints não precisavam de tradução.  
Além disto é utilizado o RSpec para criação dos testes automatizados.  
Para o ambiente de desenvolvimento com o código estão os arquivos de configuração do Docker para facilitar.  
As respostas da API seguem o padrão REST, porém só foram implementados os endpoints solicitados no desafio.  
Ao final há uma sugestão com os próximos passos. Algumas coisas foram deixadas de lado na solução por questões de tempo disponível.  

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
docker-compose run web rake db:setup
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

## Próximos passos
- Alterar porta mapeada pelo docker para 9000 conforme documentação do desafio
- Configurar i18n para exibir mensagens de erro em português
- Refactoring dos níveis de experiência para utilizar o banco de dados ao invés de dados fixos
- Implementar mecanismo de paginação no endpoint de ranking
- Criar demais rotas REST das entidades do sistema para permitir gerenciamento completo
- Implementar autenticação da API
- Criar configurações de produção da aplicação
- Configurar capistrano para deploy em máquinas remotas
- Criar configuração docker mais próxima de produção. Com nginx, passenger e postgres, por exemplo.
