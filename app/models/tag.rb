# coding: utf-8
class Tag < ActiveRecord::Base
  has_many :tag_blogs, dependent: :destroy
  has_many :blogs, -> { where publish: true, active: true }, through: :tag_blogs
  scope :desc, -> { order created_at: :desc }

  class << self
    def hots
      sql = <<-SQL
        SELECT t.* FROM tags AS t
        LEFT JOIN tag_blogs AS tb
        ON t.id = tb.tag_id
        LEFT JOIN blogs AS b
        ON tb.blog_id = b.id AND b.publish IS TRUE AND b.active IS TRUE
        GROUP BY tb.tag_id
        ORDER BY COUNT(tb.blog_id) DESC
        LIMIT 5
      SQL
      Tag.find_by_sql(sql)
    end
  end

end
