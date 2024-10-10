class CreateQuartos < ActiveRecord::Migration[7.0]
  def change
    create_table :quartos do |t|
      t.string :numero, null: false
      t.text :descricao
      t.string :tipo
      t.decimal :preco_diaria, null: false, default: 0.0
      t.integer :capacidade_maxima, null: false

      t.timestamps
    end
    add_index :quartos, :numero, unique: true
  end
end