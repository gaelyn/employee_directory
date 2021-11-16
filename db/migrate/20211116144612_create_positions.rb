class CreatePositions < ActiveRecord::Migration[5.2]
  def change
    create_table :positions do |t|
      t.string :title
      t.boolean :active
      t.integer :historical_index
      t.belongs_to :employee, foreign_key: true

      t.timestamps
    end
  end
end
