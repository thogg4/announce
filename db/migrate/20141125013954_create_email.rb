class CreateEmail < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.string :email
      t.boolean :active
      t.integer :delivery_id
    end
  end
end
