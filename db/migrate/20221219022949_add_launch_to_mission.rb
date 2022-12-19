class AddLaunchToMission < ActiveRecord::Migration[7.0]
  def change
    add_reference :missions, :launch, null: true, foreign_key: true, index: true, type: :uuid
  end
end
