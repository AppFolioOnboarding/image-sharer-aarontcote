require 'test_helper'
require_relative 'images_controller_test_helper'

class ImagesControllerCreateTest < ActionDispatch::IntegrationTest
  include ImagesControllerTestHelper

  test 'create should show image url create form' do
    get new_image_path
    assert_response :ok

    assert_select 'input' do
      assert_select '[name=?]', 'image[url]'
      assert_select '[name=?]', 'image[tag_list]'
      assert_select '[name=?]', 'commit'
    end
  end

  test 'create should create an image url without tags' do
    assert_difference 'Image.count' do
      post images_path, params: { image: { url: IMAGE_URL } }
      assert_redirected_to image_path(Image.last)
    end
  end

  test 'create should create an image url with an empty tag' do
    assert_difference 'Image.count' do
      post images_path, params: { image: { url: IMAGE_URL,
                                           tag_list: '' } }
      assert_redirected_to image_path(Image.last)
    end
  end

  test 'create should create an image url with a single tag' do
    assert_difference 'Image.count' do
      post images_path, params: { image: { url: IMAGE_URL,
                                           tag_list: 'appfolio' } }
      assert_redirected_to image_path(Image.last)
    end
  end

  test 'create should create an image url with multiple tags' do
    assert_difference 'Image.count' do
      post images_path, params: { image: { url: IMAGE_URL,
                                           tag_list: 'appfolio, goleta, california' } }
      assert_redirected_to image_path(Image.last)
    end
  end

  test 'create should prevent image url from saving with empty string' do
    assert_difference 'Image.count', 0 do
      post images_path, params: { image: { url: '', tag_list: '' } }
    end

    assert_response :unprocessable_entity

    assert_select 'ul' do
      assert_select '[id=?]', 'errorList'
    end
  end
end
