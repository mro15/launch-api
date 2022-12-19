class CreateLaunchServiceProviders < ActiveRecord::Migration[7.0]
  def change
    create_table :launch_service_providers do |t|
      t.integer :launch_service_provider_id
      t.string :url
      t.string :name
      t.string :service_provider_type

      t.timestamps
    end
  end
end
