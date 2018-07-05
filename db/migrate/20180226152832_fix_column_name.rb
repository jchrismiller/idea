class FixColumnName < ActiveRecord::Migration
  def self.up
  	rename_column :users, :last_name, :alias
  end
end
