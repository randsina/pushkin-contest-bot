require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module PushkinContestBot
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true

    def get_mask(row)
      mask = Hash.new(0)
      row.gsub(/\s/, '').split('').each {|char| mask[char] += 1 }
      mask
    end

    poems = JSON.parse(File.read(File.expand_path('../../db/poems.json', __FILE__)))
    hash = {}
    poems.each_pair { |key, value| hash[key] = [value, get_mask(key)] }

    config.x.poems_hash = hash
  #  poems = JSON.parse(File.read(File.expand_path('../../db/poems-full.json', __FILE__)))
  #  hash = {}
  #  poems.each {|poem| poem[1].each {|row| hash[row] = poem[0] }} # key => row, value => title
  #  poems[1][1].map { |row| row.mb_chars.normalize.gsub(/\p{P}/, '').downcase.squish.to_s } # normalize row

  #  hash = Hash.new(0)
  #  poem.row.gsub(/\s/, '').split('').map {|char| hash[char] += 1 } # add mask
  end
end
