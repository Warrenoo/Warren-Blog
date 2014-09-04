require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module WarrenBlog
  class Application < Rails::Application

    # assets包含的文件路径
    config.assets.paths << Rails.root.join('vendor', 'assets')

    config.active_record.default_timezone = :local
    config.time_zone = 'Beijing'

    #config.force_ssl = true

    # 设置语言
    config.i18n.default_locale = "zh-CN"
    I18n.enforce_available_locales = false
  end
end
