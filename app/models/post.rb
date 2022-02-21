class Post < ApplicationRecord
  validates :title, presence: true, length: { in: 2..255 }
  validates :body,  presence: true, length: { in: 2..500 }
end
