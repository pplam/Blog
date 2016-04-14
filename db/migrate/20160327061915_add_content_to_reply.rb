class AddContentToReply < ActiveRecord::Migration
  def change
    add_column :replies, :content, :text
  end
end
