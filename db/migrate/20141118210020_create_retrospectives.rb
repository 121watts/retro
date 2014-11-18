class CreateRetrospectives < ActiveRecord::Migration
  def change
    create_table :retrospectives do |t|
      t.string :title
      t.string :body
      t.string :user_id

      t.timestamps
    end
  end
end
