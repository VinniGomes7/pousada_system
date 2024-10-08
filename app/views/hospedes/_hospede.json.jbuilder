json.extract! hospede, :id, :nome, :documento, :email, :telefone, :endereco, :created_at, :updated_at
json.url hospede_url(hospede, format: :json)
