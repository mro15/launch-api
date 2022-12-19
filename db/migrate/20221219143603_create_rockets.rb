class CreateRockets < ActiveRecord::Migration[7.0]
  def change
    create_table :rockets do |t|
      t.references :rocket_configuration, null: true, foreign_key: true

      t.timestamps
    end
  end
end
