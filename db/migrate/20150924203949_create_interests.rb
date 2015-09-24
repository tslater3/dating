class CreateInterests < ActiveRecord::Migration
  def change
    create_table :interests do |t|
      t.string :profession
      t.string :hobbies
      t.integer :kids
      t.boolean :party
      t.belongs_to :user

      t.timestamps null: false
    end
  end
end
