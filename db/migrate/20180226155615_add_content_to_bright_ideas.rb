class AddContentToBrightIdeas < ActiveRecord::Migration
  def change
    add_column :bright_ideas, :content, :string
  end
end
