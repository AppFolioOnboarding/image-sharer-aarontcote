require 'test_helper'
require_relative 'images_controller_test_helper'

class ImagesControllerIndexTest < ActionDispatch::IntegrationTest
  include ImagesControllerTestHelper

  test 'index should show all images' do
    setup_sample_image_data

    get images_path
    assert_response :ok

    page_image_count = 0
    source_image_count = Image.all.count

    assert_select 'div.card-body' do |elements|
      elements.each do
        page_image_count += 1
      end
    end
    assert_equal source_image_count, page_image_count
  end

  test 'index should show all images with selected tag' do
    setup_sample_image_data

    get images_path(tag: TAG_NAME)
    assert_response :ok

    page_image_count = 0
    source_image_count = Image.tagged_with(TAG_NAME).count

    assert_select 'div.card-body' do |elements|
      elements.each do
        page_image_count += 1
      end
    end
    assert_equal source_image_count, page_image_count
  end

  test 'index should show no images' do
    Image.delete_all

    get images_path
    assert_response :ok

    assert_select '.js-no-images'
  end

  test 'index should show no when tag is not used' do
    setup_sample_image_data

    get images_path(tag: TAG_NAME_INVALID)
    assert_response :ok

    assert_select '.js-no-images'
  end

  test 'index should list newest image first' do
    setup_sample_image_data

    get images_path
    assert_response :ok

    image = Image.last

    assert_select 'a.btn' do
      assert_select '[href=?]', image_path(image)
    end

    assert_select 'img' do |images|
      assert_equal image.id.to_s, images[0].attributes['id'].value
    end

    assert_select 'div.card-footer' do |image_tags|
      assert_select image_tags[0], 'a.js-tag', count: image.tag_list.size do |elems|
        elems.each_with_index do |elem, i|
          assert_equal image.tag_list[i], elem.text
          assert_equal images_path(tag: image.tag_list[i]), elem['href']
        end
      end
    end
  end

  test 'index should have all images limited to 400px' do
    setup_sample_image_data

    get images_path
    assert_response :ok

    assert_select 'div.card-body' do |elements|
      elements.each do |element|
        assert_select element, 'img' do
          assert_select '[class=?]', 'card-image'
        end
      end
    end
  end
end
