class CreateVotes < ActiveRecord::Migration[6.0]
  def change
    create_table :votes do |t|
      t.bigint :user_id
      t.integer :votable_id
      t.string :votable_type

      t.timestamps
    end
  end
end
