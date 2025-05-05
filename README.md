# Gerenciador de Mensalidades📚

Api desenvolvida em Rails para gerenciamento de mensalidades de alunos em instituições, visando facilitar o controle de faturas, alunos e instituições parceiras.

## Principais Funcionalidades
- Cadastro e controle de **Alunos**
- Gerenciamento de **Instituições**
- Geração dinânica de faturas após criação da matrícula
- Gerenciamento de matrículas e acompanhamento das mensalidades
- Geração inteligente de datas de vencimento a partir da data atual e quantidade total de parcelas

## Execução do Projeto
### Pré-requisitos

- Ruby >= 3.x
- Rails >= 8.x
- SQLite

### Passos
1. Clone o repositório
```bash
git clone https://github.com/davisonqueiroz/gerenciador_mensalidades.git
```
2. Instale as dependências
```bash
bundle install
```
3. Configure o Banco de Dados
```bash
rails db: create
rails db:migrate
```
4. Inicie o servidor
```bash
rails server
```
5. Acesse http://localhost:3000

### **Observação** ⚠
Para consumir a API via ferramentas como Postman, é necessário o seguinte cabeçalho para garantir o retorno correto em JSON: 
```bash
Accept: application/json
```

## Endpoints Principais

- GET /universities - Lista as instituições
- GET /students - Lista os alunos
- GET /enrollments - Lista as matrículas
- GET /invoices - Lista as faturas
- POST /universities - Cria uma nova instituição
- POST /students - Cria um novo aluno
- POST /enrollments - Cria uma nova matrícula

## Estrutura das Entidades

### Enrollment

| Valor | Descrição |
|-------|-----------|
|total_value |  Valor total da matrícula|
|invoice_quantity |  Quantidade de parcelas|
|due_day |  Dia de vencimento da fatura| 
|course_name |  Nome do curso| 
|university |  Referência á instituição| 
|student |  Referência ao aluno| 
 
### Student

| Valor | Descrição |
|-------|-----------|
|name |  Nome do aluno|
|cpf |  Documento do aluno|
|date_of_birth |  Data de nascimento| 
|cellphone |  Telefone para contato| 
|gender |  Gênero do aluno| 
|payment_method |  Método de pagamento| 

### University

| Valor | Descrição |
|-------|-----------|
|name |  Nome da instituição|
|cnpj |  Documento identificador da instituição|
|university_type |  Tipo de instituição| 

### Invoice

| Valor | Descrição |
|-------|-----------|
|invoice_value |  Valor da fatura|
|due_date |  Data de vencimento da fatura|
|enrollment |  Referência à matrícula| 
|status |  Status da fatura| 