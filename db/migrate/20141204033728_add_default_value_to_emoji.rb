class AddDefaultValueToEmoji < ActiveRecord::Migration
  def change
    change_column :feels, :emoji, :string, :default => '4'
  end
end
