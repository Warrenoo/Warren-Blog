# -*- coding: utf-8 -*-
#引用次模块用以注入图片上传方法
#需要使用gem paperclip
module UploadImage
  extend ActiveSupport::Concern

  included do
    #after_save :save_image_proxies
    after_destroy :clear_image
  end


  private

  #将代理图片保存或更新到imagebox中
  #def save_image_proxies
    #self.class.image_proxies.each do |attr|
      #next unless self.respond_to? attr
      #next unless self.send attr

      #image_boxes = self.send(attr).dup

      #image_boxes.each do |ib|
        #format_ib = ImageBox.format_date(ib, self, attr)
        #if format_ib.has_key? "id"
          #ib_id = format_ib.delete("id")
          #ImageBox.update(ib_id, format_ib)
        #else
          #ImageBox.create(format_ib)
        #end
      #end

    #end
  #end

  #对象删除后自动清除代理图片数据
  #def clear_image_box
    #self.class.image_proxies.each do |attr|
      #next unless self.respond_to? "_#{attr}"
      #self.send("_#{attr}").delete_all
    #end
  #end

  #对象删除后自动清除图片文件
  def clear_image
    self.class.image_attrs.each do |attr|
      next unless self.respond_to? attr
      self.send(attr).clear
    end
  end

  module ClassMethods

    #返回所有已设置为上传图片的字段
    def image_attrs
      @@image_attrs ||= []
      @@image_attrs.flatten!
      @@image_attrs
    end

    #def image_proxies
      #@@image_proxies ||= []
      #@@image_proxies.flatten!
      #@@image_proxies
    #end

    #设置字段用以上传图片
    #使用 has_image_attrs :img, :small_img
    #     has_image_attrs [:img, :small_img]
    def has_image_attrs (*attrs)
      raise "no attrs for has_image_attrs" if attrs.empty?
      attrs.flatten.each do |attr|

        conf = {
          styles: {
            optimize: {
              paperclip_optimizer: {
                jpegoptim: {max_quality: 95},
                optipng: {level: 6},
              }
            }
          },
          default_style: :optimize,
          default_url: "/assets/images/missing.jpg",
          processors: [:thumbnail, :paperclip_optimizer],
          url: "/images/#{self.name.underscore}/#{attr.to_s}/:style/:id.:extension"
        }

        conf[:path] = ":rails_root/public/images/#{self.name.underscore}/#{attr.to_s}/:style/:id.:extension"

        has_attached_file attr, conf

        #validates_attachment attr.to_sym, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]
        do_not_validate_attachment_file_type attr.to_sym  #不进行验证

        define_method("#{attr}_simple") { self.send(attr).url(:optimize, false) }
      end

      image_attrs << attrs
    end


    #设置存放在image_box中的图片列表字段
    #使用 has_image_proxies :img, :small_img
    #     has_image_proxies [:img, :small_img]
    #def has_image_proxies (*attrs)
      #raise "no attrs for has_image_attrs" if attrs.empty?
      #attrs.flatten.each do |attr|
        #define_method "_#{attr}" do
          #ImageBox.get_images(self.class.name, id, attr.to_s)
        #end

        #attr_accessor attr
      #end
      #image_proxies << attrs
    #end

  end

end
