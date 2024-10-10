class User < ApplicationRecord
  # Validação dos atributos
  has_secure_password  # Adicionando suporte a senha segura

  validates :nome, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { minimum: 6 }
end