require 'test_helper'
require_relative 'images_controller_test_helper'

class ImagesControllerShowTest < ActionDispatch::IntegrationTest
  include ImagesControllerTestHelper

  test 'show should show an image from the url' do
    created_image = create_single_image
    get image_path(created_image.id)
    assert_response :ok

    assert_select 'img' do
      assert_select '[src=?]', created_image.url
      assert_select '[class=?]', 'card-image'
    end

    assert_select 'a.js-tag', count: created_image.tag_list.size do |elems|
      elems.each_with_index do |elem, i|
        assert_equal created_image.tag_list[i], elem.text
        assert_equal images_path(tag: created_image.tag_list[i]), elem['href']
      end
    end
  end
end
