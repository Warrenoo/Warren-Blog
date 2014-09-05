# coding: utf-8
class Tag < ActiveRecord::Base
  has_many :tag_blogs, dependent: :destroy
  has_many :blogs, through: :tag_blogs
end
