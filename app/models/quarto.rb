class Quarto < ApplicationRecord
  validates :numero, presence: true, uniqueness: true
  validates :descricao, presence: true, length: { maximum: 500 }
  validates :preco_diaria, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :capacidade_maxima, presence: true, numericality: { only_integer: true, greater_than: 0 }

  def to_s
    "#{descricao} (Quarto ##{numero})"
  end
end