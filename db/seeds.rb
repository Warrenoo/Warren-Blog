# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
t = Tag.first
(1..100).each do
  b=Blog.first.dup
  if b.save
    tb = TagBlog.create(tag_id: t.id, blog_id: b.id)
  end
end
