# coding: utf-8
class Tag < ActiveRecord::Base
  has_many :tag_blogs, dependent: :destroy
  has_many :blogs, through: :tag_blogs
  scope :desc, -> { order created_at: :desc }
  scope :hots, -> { joins(:tag_blogs).group("tag_id").order("count(blog_id) desc").limit(5) }

end
