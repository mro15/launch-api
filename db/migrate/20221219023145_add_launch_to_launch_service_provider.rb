class AddLaunchToLaunchServiceProvider < ActiveRecord::Migration[7.0]
  def change
    add_reference :launch_service_providers, :launch, null: true, foreign_key: true, index: true, type: :uuid
  end
end
