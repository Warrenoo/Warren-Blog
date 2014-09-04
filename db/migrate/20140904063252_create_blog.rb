class CreateBlog < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :title
      t.text   :content
      t.text   :markdown_content

      t.timestamps
    end
  end
end
