class ChangeRetroBodyType < ActiveRecord::Migration
  def change
    change_column :feels, :body, :text
  end
end
