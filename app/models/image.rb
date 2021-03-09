class Image < ApplicationRecord
  validates :url,
            presence: true,
            length: { minimum: 10, maximum: 2048 },
            format: { with: URI.regexp(%w[http https]), message: 'has an invalid format' }
end
