class CreateReservas < ActiveRecord::Migration[7.0]
  def change
    create_table :reservas do |t|
      t.date :data_entrada, null: false
      t.date :data_saida, null: false
      t.references :hospede, null: false, foreign_key: true
      t.references :quarto, null: false, foreign_key: true

      t.timestamps
    end
  end
end