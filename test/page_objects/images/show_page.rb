require 'page_objects/images/image_card'

module PageObjects
  module Images
    class ShowPage < PageObjects::Document
      path :image

      element :image, locator: '.card', is: ImageCard
      collection :tag, locator: '.js-tag'

      delegate :url, to: :image, prefix: true

      delegate :tags, to: :image

      def delete
        node.find('.btn').click
        yield node.driver.browser.switch_to.alert
      end

      def delete_and_confirm!
        document.node.accept_confirm do
          node.find('.btn').click
        end
        window.change_to(IndexPage)
      end

      def go_back_to_index!
        node.find('.navbar-brand').click
        window.change_to(IndexPage)
      end
    end
  end
end
