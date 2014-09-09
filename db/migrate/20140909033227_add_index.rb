class AddIndex < ActiveRecord::Migration
  def change
    add_index :blogs, :updated_at
    add_index :tags,  :updated_at
    add_index :tag_blogs, :tag_id
    add_index :tag_blogs, :blog_id
  end
end
