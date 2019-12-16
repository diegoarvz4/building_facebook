class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :content
      t.integer :author_id, index: true
      t.integer :post_id, index: true

      t.timestamps
    end

    add_foreign_key :comments, :users, column: :author_id
    add_foreign_key :comments, :posts, column: :post_id

  end
end
