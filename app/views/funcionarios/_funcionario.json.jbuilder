json.extract! funcionario, :id, :nome, :documento, :email, :cargo, :telefone, :created_at, :updated_at
json.url funcionario_url(funcionario, format: :json)
