class RenameAliasToLastName < ActiveRecord::Migration
  def change
  	rename_column :users, :alias, :last_name
  end
end
