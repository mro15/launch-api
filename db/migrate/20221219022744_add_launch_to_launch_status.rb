class AddLaunchToLaunchStatus < ActiveRecord::Migration[7.0]
  def change
    add_reference :launch_statuses, :launch, null: true, foreign_key: true, index: true, type: :uuid
  end
end
