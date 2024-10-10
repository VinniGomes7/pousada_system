class Funcionario < ApplicationRecord
  validates :nome, presence: true
  validates :documento, presence: true, uniqueness: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :telefone, presence: true
  validates :cargo, presence: true
  validates :salario, presence: true, numericality: { greater_than_or_equal_to: 0 }
end