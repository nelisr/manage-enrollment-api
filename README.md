## Manage Enrollment API

### Como usar?

1. Clonar o projeto
```
git clone url
```

2. Entrar no diretório do projeto clonado e instalar as dependências
```
bundle install
```

3. Criar uma cópia do arquivo `.env.sample` para passar como `ENV` as credenciais do banco de dados
```
cp .env.sample .env
```

4. Com o arquivo `.env` criado agora basta passar as credenciais do banco
```
DB_HOST=0.0.0.0
DB_PORT=5432
DB_USER=postgres
DB_PASSWORD=
```

5. Após o acesso ao banco configurado, agora é rodar o comando abaixo para criar a estrutura do banco
```
bundle exec rails db:create db:migrate
```

6. Com a estrutura do banco criada, agora é possível `startar` a aplicação
```
bin/rails s
```

7. Agora para testar os endpoints implementados basta importar a collection (manage-enrollment-api.json) no postman.

 
