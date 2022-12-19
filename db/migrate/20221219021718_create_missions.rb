class CreateMissions < ActiveRecord::Migration[7.0]
  def change
    create_table :missions do |t|
      t.integer :launch_library_id
      t.string :name
      t.string :description
      t.string :launch_designator
      t.string :mission_type

      t.timestamps
    end
  end
end
