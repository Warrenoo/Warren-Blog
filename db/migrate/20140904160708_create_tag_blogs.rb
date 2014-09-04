class CreateTagBlogs < ActiveRecord::Migration
  def change
    create_table :tag_blogs do |t|
      t.integer :tag_id
      t.integer :blog_id

      t.timestamps
    end
  end
end
