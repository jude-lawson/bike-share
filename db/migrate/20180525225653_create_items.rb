class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :title
      t.integer :prices
      t.string :description

      t.timestamps null: false
    end
  end
end
