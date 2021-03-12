require 'test_helper'

class ImagesControllerTest < ActionDispatch::IntegrationTest
  test 'should show all images' do

    get images_path
    assert_response :ok

    source_image_count = Image.all.count

    if source_image_count.positive?
      page_image_count = 0

      assert_select 'div.card-body' do |elements|
        elements.each do
          page_image_count += 1
        end
      end
    end

    assert_equal(source_image_count, page_image_count)
  end

  test 'should have all images limited to 400px' do

    get images_path
    assert_response :ok

    assert_select 'div.card-body' do |elements|
      elements.each do |element|
        assert_select element, 'img' do
          assert_select '[style=?]', 'max-width: 400px;'
        end
      end
    end
  end

  test 'should show image url create form' do
    get new_image_path
    assert_response :ok

    assert_select 'input' do
      assert_select '[name=?]', 'image[url]'
      assert_select '[name=?]', 'commit'
    end
  end

  test 'should create an image url' do
    assert_difference 'Image.count' do
      post images_path, params: { image: { url: 'https://pa.cdn.appfolio.com/appfolio/images/apm-white.svg' } }
      assert_redirected_to image_path(Image.last)
    end
  end

  test 'should show an image from the url' do
    created_image_url = Image.create(url: 'https://www.appfolio.com/_nuxt/img/logo-apm-horizontal.6400026.svg')
    get image_path(created_image_url.id)
    assert_response :ok

    assert_select 'img' do
      assert_select '[src=?]', 'https://www.appfolio.com/_nuxt/img/logo-apm-horizontal.6400026.svg'
    end
  end

  test 'should prevent image url from saving' do
    assert_difference 'Image.count', 0 do
      post images_path, params: { image: { url: '' } }
    end

    assert_response :unprocessable_entity

    assert_select 'ul' do
      assert_select '[id=?]', 'errorList'
    end
  end
end
