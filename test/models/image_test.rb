require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  test 'should not save empty image url' do
    image = Image.new
    assert_not image.valid?
    assert_includes(image.errors.full_messages, "Url can't be blank")
  end

  test 'should not save short image url' do
    image = Image.new
    image.url = 'http://i.'
    assert_not image.valid?
    assert_includes(image.errors.full_messages, 'Url is too short (minimum is 10 characters)')
  end

  test 'should not save long image url' do
    image = Image.new
    image.url = 'http://www.loremipsumdolorsitametconsecteturadipiscingelitsedloremipsumdolorsitametconsecteturadipiscingelitsedloremipsumdolorsitametconsecteturadipiscingelitsedloremipsumdolorsitametconsecteturadipiscingelitsedloremipsumdolorsitametconsecteturadipiscingelitsedloremipsumdolorsitametconsecteturadipiscingelitsedloremipsumdolorsitametconsecteturadipiscingelitsedloremipsumdolorsitametconsecteturadipiscingelitsedloremipsumdolorsitametconsecteturadipiscingelitsedloremipsumdolorsitametconsecteturadipiscingelitsedloremipsumdolorsitametconsecteturadipiscingelitsedloremipsumdolorsitametconsecteturadipiscingelitsedloremipsumdolorsitametconsecteturadipiscingelitsedloremipsumdolorsitametconsecteturadipiscingelitsedloremipsumdolorsitametconsecteturadipiscingelitsedloremipsumdolorsitametconsecteturadipiscingelitsedloremipsumdolorsitametconsecteturadipiscingelitsedloremipsumdolorsitametconsecteturadipiscingelitsedloremipsumdolorsitametconsecteturadipiscingelitsedloremipsumdolorsitametconsecteturadipiscingelitsedloremipsumdolorsitametconsecteturadipiscingelitsedloremipsumdolorsitametconsecteturadipiscingelitsedloremipsumdolorsitametconsecteturadipiscingelitsedloremipsumdolorsitametconsecteturadipiscingelitsedloremipsumdolorsitametconsecteturadipiscingelitsedloremipsumdolorsitametconsecteturadipiscingelitsedloremipsumdolorsitametconsecteturadipiscingelitsedloremipsumdolorsitametconsecteturadipiscingelitsedloremipsumdolorsitametconsecteturadipiscingelitsedloremipsumdolorsitametconsecteturadipiscingelitsedloremipsumdolorsitametconsecteturadipiscingelitsedloremipsumdolorsitametconsecteturadipiscingelitsedloremipsumdolorsitametconsecteturadipiscingelitsedloremipsumdolorsitametconsecteturadipiscingelitsedloremipsumdolorsitametconsecteturadipiscingelitsedloremipsumdolorsitametconsecteturadipiscingelitsedloremipsumdolorsitametconsecteturadipiscingelitsedloremipsumdolorsitametconsecteturadipiscingelitsedloremipsumdolorsitametconsecteturadipiscingelitsedloremipsumdolorsitametconsecteturadipiscingelitsedloremipsumdolorsitametconsecteturadipiscingelitsedloremipsumdolorsitametconsecteturadipiscingelitsed.com/image.png'
    assert_not image.valid?
    assert_includes(image.errors.full_messages, 'Url is too long (maximum is 2048 characters)')
  end

  test 'should not save invalid image url' do
    image = Image.new
    image.url = 'htp:/www.image.com'
    assert_not image.valid?
    assert_includes(image.errors.full_messages, 'Url has an invalid format')
  end

  test 'should save valid image url' do
    image = Image.new
    image.url = 'https://www.appfolio.com/_nuxt/img/logo-apm-horizontal.6400026.svg'
    assert image.valid?
  end
end
