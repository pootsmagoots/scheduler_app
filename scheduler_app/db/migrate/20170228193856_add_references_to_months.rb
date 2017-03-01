class AddReferencesToMonths < ActiveRecord::Migration[5.0]
  def change
    add_reference :meetings, :month
  end
end
