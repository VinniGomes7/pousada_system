FactoryBot.define do
    factory :quarto do
      numero { 101 } 
      descricao { "Quarto Duplo" }
      preco_diaria { 100.0 }
      capacidade_maxima { 2 }
    end
  end  