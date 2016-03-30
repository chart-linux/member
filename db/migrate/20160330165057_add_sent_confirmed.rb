class AddSentConfirmed < ActiveRecord::Migration[5.0]
  def change
    add_column :members, :sent_confirmed, :boolean, null: false, default: false
  end
end
