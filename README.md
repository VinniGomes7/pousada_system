# Pousada System

Este README documenta os passos necessários para configurar e executar a aplicação **Pousada System**.

## Badge do Codacy
[![Codacy Badge](https://app.codacy.com/project/badge/Grade/7f0807259b1e4d1bbf7ce9b5acdb5bef)](https://app.codacy.com/gh/VinniGomes7/pousada_system/dashboard?utm_source=gh&utm_medium=referral&utm_content=&utm_campaign=Badge_grade)

## Ruby Version
A aplicação foi desenvolvida utilizando Ruby versão **3.1.2**.

## Dependências do Sistema
Certifique-se de ter as seguintes dependências instaladas:
- Ruby (>= 3.1.2)
- Rails (>= 7.x)
- PostgreSQL

## Configuração

1. **Clone o repositório:**
   ```bash
   git clone https://github.com/VinniGomes7/pousada_system.git
   cd pousada_system
   ```

2. **Instale as dependências:** Certifique-se de que você está no diretório do projeto, e então execute:
   ```bash
   bundle install
   ```

3. **Configuração do Banco de Dados:** A aplicação utiliza PostgreSQL. Antes de rodar a aplicação, você deve configurar o banco de dados:

   - O Render já está configurado para gerenciar o banco de dados. 
   - A URL do banco de dados será automaticamente carregada a partir da variável de ambiente `DATABASE_URL` fornecida pelo Render.
   - Se estiver executando localmente, configure o banco de dados conforme necessário no arquivo `config/database.yml`.

4. **Configuração das Variáveis de Ambiente:** Certifique-se de que as seguintes variáveis de ambiente estejam configuradas:
   - `RAILS_MASTER_KEY`: Chave usada para descriptografar as credenciais da aplicação. No Render, você pode configurar esta chave em Settings > Environment no painel do projeto.

   ```bash
   RAILS_MASTER_KEY=76050ff8ecc1d5ec512d118d5f96031f
   ```

5. **Migrações do Banco de Dados:** Após configurar o banco de dados e as variáveis de ambiente, execute as migrações para preparar o banco de dados:
   ```bash
   rails db:create db:migrate
   ```

## Executando a Aplicação

- **Localmente:** Para rodar a aplicação em um ambiente de desenvolvimento local, execute:
   ```bash
   rails server
   ```
   Acesse no navegador: [http://localhost:3000](http://localhost:3000)

- **No Render:** A aplicação está disponível online no Render. Você pode acessar a versão implantada através da seguinte URL:

   **Pousada System no Render**

## Credenciais para Testes no Render
- URL da Aplicação: [https://my-rails-app-nha8.onrender.com](https://my-rails-app-nha8.onrender.com)
- Login: `admin`
- Senha: `password123`

## Testes
O projeto contém testes de unidade e integração. Para executá-los localmente, use o seguinte comando:
```bash
bundle exec rspec
```
Os testes são executados automaticamente através do GitHub Actions em cada commit push.
