class Funcionario < ApplicationRecord
    validates :nome, presence: true
    validates :documento, presence: true, uniqueness: true
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :telefone, presence: true
    validates :cargo, presence: true
  end  