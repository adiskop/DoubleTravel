class CreateDestinations < ActiveRecord::Migration[6.1]
  def change
    create_table :destinations do |t|
      t.string :name
      t.string :continent
      t.integer :user_id

      t.timestamps
    end
  end
end
