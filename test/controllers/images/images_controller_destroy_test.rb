require 'test_helper'
require_relative 'images_controller_test_helper'

class ImagesControllerShowTest < ActionDispatch::IntegrationTest
  include ImagesControllerTestHelper

  test 'delete should delete image' do
    created_image = create_single_image

    assert_difference 'Image.count', -1 do
      delete image_path(created_image)
    end

    assert_redirected_to images_path
  end

  test 'delete should not delete image for an invalid image id' do
    assert_difference 'Image.count', 0 do
      delete image_path(-1)
    end

    assert_response :not_found
  end
end
