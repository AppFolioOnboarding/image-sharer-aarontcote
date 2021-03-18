module PageObjects
  module Images
    class ImageCard < AePageObjects::Element
      element :image, locator: '.card-image'
      collection :tag, locator: '.js-tag'

      def url
        image.node[:src]
      end

      def tags
        tag.text.split(' ')
      end

      def click_tag!(tag_name)
        node.click_on(tag_name)
        window.change_to(IndexPage)
      end
    end
  end
end
