class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title,  null: false, limit: 255
      t.text :body,     null: false, limit: 500

      t.timestamps
    end
  end
end
