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

  test 'index should show no images' do
    Image.delete_all

    get images_path
    assert_response :ok

    assert_select 'h3.text-center'
  end

  test 'index should list newest image first' do
    setup_sample_image_data

    get images_path
    assert_response :ok

    image = Image.last

    assert_select 'img' do |images|
      assert_equal image.id.to_s, images[0].attributes['id'].value
    end

    assert_select 'p.text-primary' do |tags|
      assert_equal "Tags: #{image.tag_list.join(', ')}", tags[0].text
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
