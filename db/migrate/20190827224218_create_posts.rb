class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :content
    #  t.references :author_id, foreign_key: true
      t.integer :author_id, index: true
      t.timestamps
    end

    add_foreign_key :posts, :users, column: :author_id

  end
end
