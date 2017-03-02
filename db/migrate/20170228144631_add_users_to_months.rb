class AddUsersToMonths < ActiveRecord::Migration[5.0]
  def change
    add_reference :months, :user, foreign_key: true
  end
end
