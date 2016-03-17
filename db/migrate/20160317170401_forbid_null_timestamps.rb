require 'time'

class ForbidNullTimestamps < ActiveRecord::Migration[5.0]
  def change
    Room.update_all(created_at: Time.zone.local(2015, 4, 1))
    Member.update_all(created_at: Time.zone.local(2015, 4, 1))
    Department.update_all(created_at: Time.zone.local(2015, 4, 1))
    Committee.update_all(created_at: Time.zone.local(2015, 4, 1))
    Room.update_all(updated_at: Time.zone.local(2015, 4, 1))
    Member.update_all(updated_at: Time.zone.local(2015, 4, 1))
    Department.update_all(updated_at: Time.zone.local(2015, 4, 1))
    Committee.update_all(updated_at: Time.zone.local(2015, 4, 1))

    change_column :rooms,       :created_at, :datetime, null: false
    change_column :members,     :created_at, :datetime, null: false
    change_column :departments, :created_at, :datetime, null: false
    change_column :committees,  :created_at, :datetime, null: false
    change_column :rooms,       :updated_at, :datetime, null: false
    change_column :members,     :updated_at, :datetime, null: false
    change_column :departments, :updated_at, :datetime, null: false
    change_column :committees,  :updated_at, :datetime, null: false
  end
end
