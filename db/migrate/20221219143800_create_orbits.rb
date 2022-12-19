class CreateOrbits < ActiveRecord::Migration[7.0]
  def change
    create_table :orbits do |t|
      t.integer :orbit_id
      t.string :name
      t.string :abbrev

      t.timestamps
    end
  end
end
