class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.integer :comment
      t.integer :user
      t.integer :reply_to

      t.timestamps null: false
    end
  end
end
