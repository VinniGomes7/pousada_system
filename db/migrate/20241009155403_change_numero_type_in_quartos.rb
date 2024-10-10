class ChangeNumeroTypeInQuartos < ActiveRecord::Migration[7.0]
  def change
    change_column :quartos, :numero, :integer, null: false, using: 'numero::integer'
  end
end