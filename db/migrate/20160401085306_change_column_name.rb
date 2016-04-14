class ChangeColumnName < ActiveRecord::Migration
  def change
	  rename_column :articles, :author, :user_id
	  rename_column :comments, :article, :article_id
	  rename_column :comments, :user, :user_id
	  rename_column :replies, :comment, :comment_id
	  rename_column :replies, :user, :user_id
  end
end
