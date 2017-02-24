class CreateVrails < ActiveRecord::Migration[5.0]
  def change
    create_table :vrails do |t|
      t.string :g
      t.string :model
      t.string :Visit
      t.integer :link_id
      t.string :ip_address

      t.timestamps
    end
  end
end
