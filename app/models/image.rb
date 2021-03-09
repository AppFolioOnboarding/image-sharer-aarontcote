class Image < ApplicationRecord
    validates :url, presence: true, length: { minimum: 10, maximum: 2048 }
end
