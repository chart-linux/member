class ChangeIsAbsentToBoolean < ActiveRecord::Migration[5.0]
  def change
    change_column :members, :is_absent, :boolean, default: false
  end
end
