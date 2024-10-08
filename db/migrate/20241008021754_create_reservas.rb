class CreateReservas < ActiveRecord::Migration[7.0]
  def change
    create_table :reservas do |t|
      t.date :data_inicio
      t.date :data_fim
      t.references :hospede, null: false, foreign_key: true
      t.references :quarto, null: false, foreign_key: true

      t.timestamps
    end
  end
end
