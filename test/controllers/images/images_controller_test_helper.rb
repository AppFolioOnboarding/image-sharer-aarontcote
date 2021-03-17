require 'test_helper'

module ImagesControllerTestHelper
  IMAGE_URL = 'https://pa.cdn.appfolio.com/appfolio/images/apm-white.svg'.freeze
  TAG_NAME = 'logo'.freeze
  TAG_NAME_INVALID = 'invalid'.freeze

  # Tests for the different views broken out into different test files within this same directory

  private

  def setup_sample_image_data
    Image.delete_all

    Image.create(url: 'https://pa.cdn.appfolio.com/appfolio/images/apm-white.svg')
    Image.create(url: 'https://pa.cdn.appfolio.com/appfolio/images/apm-white.svg',
                 tag_list: 'logo, appfolio')
    Image.create(url: 'https://www.google.com/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png',
                 tag_list: 'logo, google')
    Image.create(url: 'https://c0.wallpaperflare.com/preview/107/750/505/thor-s-well-united-states-yachats-pnw.jpg',
                 tag_list: 'ocean, water, thor')
  end

  def create_single_image
    Image.create(url: 'https://www.appfolio.com/_nuxt/img/logo-apm-horizontal.6400026.svg',
                 tag_list: 'appfolio, goleta, california')
  end
end
