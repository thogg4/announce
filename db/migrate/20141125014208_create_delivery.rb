class CreateDelivery < ActiveRecord::Migration
  def change
    create_table :deliveries do |t|
      t.string :name
      t.string :subject
      t.text :message
      t.boolean :active
    end
  end
end
