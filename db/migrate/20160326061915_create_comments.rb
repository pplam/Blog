class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user
      t.integer :article
      t.text :content

      t.timestamps null: false
    end
  end
end
