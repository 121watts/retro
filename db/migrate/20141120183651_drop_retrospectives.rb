class DropRetrospectives < ActiveRecord::Migration
  def change
    drop_table :retrospectives
  end
end
