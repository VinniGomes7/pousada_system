FactoryBot.define do
    factory :hospede do
      nome { "Nome do Hospede" }
      email { "hospede@example.com" }
      documento { "12345678901" }
      telefone { "1234567890" }
      endereco { "Endereço do Hospede" } # Adicionado para atender a validação
    end
  end