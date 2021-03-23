require 'page_objects/images/image_card'

module PageObjects
  module Images
    class IndexPage < PageObjects::Document
      path :images

      collection :images, locator: '.container', item_locator: '.card', contains: ImageCard do
        def view!
          node.click
          window.change_to(ShowPage)
        end
      end

      def add_new_image!
        node.click_on('Add Image')
        window.change_to(NewPage)
      end

      def showing_image?(url:, tags: nil)
        images.any? do |image|
          image.url == url &&
            ((tags.nil? || image.tags == tags))
        end
      end

      def clear_tag_filter!
        IndexPage.visit
        window.change_to(IndexPage)
      end
    end
  end
end
