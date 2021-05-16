class CreateVisitedGems < ActiveRecord::Migration[6.1]
  def change
    create_table :visited_gems do |t|
      t.string :name
      t.text :description
      t.integer :user_id
      t.integer :destination_id

      t.timestamps
    end
  end
end
