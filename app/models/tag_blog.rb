# coding: utf-8
class TagBlog < ActiveRecord::Base
  belongs_to :blog
  belongs_to :tag
end
