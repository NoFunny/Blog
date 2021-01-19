class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts, if_not_exists: true do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
