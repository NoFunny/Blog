class AddIndexToComments < ActiveRecord::Migration[6.0]
  def change
    add_index :comments, %i[commentable_id commentable_type]
  end
end
