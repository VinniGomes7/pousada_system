class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :nome
      t.string :email
      t.string :role  # Se você ainda precisar de uma função para os usuários
      t.string :password_digest # Adicionando o campo para armazenar a senha

      t.timestamps
    end
  end
end