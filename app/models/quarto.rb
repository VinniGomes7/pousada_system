class Quarto < ApplicationRecord
    validates :numero, presence: true, uniqueness: true
    validates :descricao, presence: true
    validates :preco_diaria, presence: true, numericality: { greater_than_or_equal_to: 0 }
  end  