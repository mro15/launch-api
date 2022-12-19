class AddLaunchToPad < ActiveRecord::Migration[7.0]
  def change
    add_reference :pads, :launch, null: true, foreign_key: true, index: true, type: :uuid
  end
end
