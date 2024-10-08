class CreateFuncionarios < ActiveRecord::Migration[7.0]
  def change
    create_table :funcionarios do |t|
      t.string :nome
      t.string :documento
      t.string :email
      t.string :cargo
      t.string :telefone

      t.timestamps
    end
  end
end
