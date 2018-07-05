class ChangeColumnName < ActiveRecord::Migration
  def self.up
  	rename_column :users, :first_name, :name
  end
end
