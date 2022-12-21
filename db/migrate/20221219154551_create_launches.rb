class CreateLaunches < ActiveRecord::Migration[7.0]
  def change
    create_table :launches, id: :uuid do |t|
      t.string :url
      t.integer :launch_library_id
      t.string :slug
      t.string :name
      t.string :net
      t.string :window_end
      t.string :window_start
      t.boolean :inhold
      t.boolean :tbddate
      t.boolean :tbdtime
      t.float :probability
      t.string :holdreason
      t.string :failreason
      t.string :hashtag
      t.boolean :webcast_live
      t.string :image
      t.string :infographic
      t.text :program
      t.integer :status
      t.datetime :imported_t
      t.references :launch_status, null: true, foreign_key: true, index: true, type: :integer
      t.references :rocket, null: true, foreign_key: true, index: true, type: :integer
      t.references :mission, null: true, foreign_key: true, index: true, type: :integer
      t.references :pad, null: true, foreign_key: true, index: true, type: :integer
      t.references :launch_service_provider, null: true, foreign_key: true, index: true, type: :integer

      t.timestamps
    end
  end
end
