class CreateFeels < ActiveRecord::Migration
  def change
    create_table :feels do |t|
      t.string :body
      t.string :user_id
      t.string :emoji

      t.timestamps
    end
  end
end
