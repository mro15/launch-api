class CreateRocketConfigurations < ActiveRecord::Migration[7.0]
  def change
    create_table :rocket_configurations do |t|
      t.integer :launch_library_id
      t.string :url
      t.string :name
      t.string :family
      t.string :full_name
      t.string :variant
      t.references :rocket, null: true, foreign_key: true

      t.timestamps
    end
  end
end
