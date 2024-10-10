class Reserva < ApplicationRecord
  belongs_to :hospede
  belongs_to :quarto

  validates :data_entrada, presence: true
  validates :data_saida, presence: true
  validate :data_saida_maior_que_entrada

  def data_saida_maior_que_entrada
    if data_saida.present? && data_entrada.present? && data_saida <= data_entrada
      errors.add(:data_saida, "deve ser maior que a data de entrada")
    end
  end
end