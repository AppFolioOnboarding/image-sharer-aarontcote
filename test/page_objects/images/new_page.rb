module PageObjects
  module Images
    class NewPage < PageObjects::Document
      path :new_image
      path :images

      form_for :image, locator: '.form-group' do
        element :url, locator: '.js-url'
        element :tag_list, locator: '.js-tags'
        element :error_message, locator: '.js-error'
      end

      def create_image!(image_url: nil, tags: nil)
        url.set(image_url) if image_url

        tag_list.set(tags) if tags

        node.click_button('Save URL')
        window.change_to(ShowPage, NewPage)
      end
    end
  end
end
