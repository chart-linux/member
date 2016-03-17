require 'time'

class AddTimestamps < ActiveRecord::Migration[5.0]
  def change
    add_column :rooms,       :created_at, :datetime
    add_column :members,     :created_at, :datetime
    add_column :departments, :created_at, :datetime
    add_column :committees,  :created_at, :datetime
    add_column :rooms,       :updated_at, :datetime
    add_column :members,     :updated_at, :datetime
    add_column :departments, :updated_at, :datetime
    add_column :committees,  :updated_at, :datetime
  end
end
