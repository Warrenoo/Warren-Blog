class CreateBlog < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :title
      t.text   :content
      t.text   :markdown_content
      t.boolean :active, default: true
      t.boolean :publish, default: false

      t.timestamps
    end
  end
end
