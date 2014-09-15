# coding: utf-8
class Resource < ActiveRecord::Base
  include UploadImage
  has_image_attrs :image
end

