class CreateQuartos < ActiveRecord::Migration[7.0]
  def change
    create_table :quartos do |t|
      t.string :numero
      t.text :descricao
      t.string :tipo
      t.decimal :preco

      t.timestamps
    end
  end
end
