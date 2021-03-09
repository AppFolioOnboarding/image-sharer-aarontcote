require 'test_helper'

 class ImagesControllerTest < ActionDispatch::IntegrationTest

   test 'should create an image url' do
     assert_difference 'Image.count' do
       post images_path, params: { image: { url: 'https://www.appfolio.com/_nuxt/img/logo-apm-horizontal.6400026.svg' } }
       assert_redirected_to image_path(Image.last)
     end
   end

   test 'should show an image from the url' do
     created_image_url = Image.create(url: 'https://www.appfolio.com/_nuxt/img/logo-apm-horizontal.6400026.svg')
     get image_path(created_image_url.id)
     assert_response :success

     assert_select 'img' do
       assert_select '[src=?]', 'https://www.appfolio.com/_nuxt/img/logo-apm-horizontal.6400026.svg'
     end
   end
 end