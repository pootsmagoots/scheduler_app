class CreateMonths < ActiveRecord::Migration[5.0]
  def change
    create_table :months do |t|
      t.string :name
      t.string :img_url
    end
  end
end
