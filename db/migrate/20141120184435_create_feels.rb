class CreateFeels < ActiveRecord::Migration
  def change
    create_table :feels do |t|
      t.string :body
      t.integer :emoji, default: 0
      t.references :user, index: true

      t.timestamps
    end
  end
end
