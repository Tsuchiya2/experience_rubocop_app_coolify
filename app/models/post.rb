class Post < ApplicationRecord
  validates :title, presence: true, length: { in: 2..255 }
  validates :body,  presence: true, length: { in: 2..500 }

  # ===== Fat Controller を解消するためにロジックを Model に記載する =====
  # ----- change_posts#updete に 'Post.reset_posts' と 'redirect_to' の記載だけで済むようになります(Fat Controller の解消) -----
  # class << self
  #   def reset_posts
  #     Post.transaction do
  #       magic_number = (1..9).to_a.sample
  #       Post.destroy_all
  #       roundom_create_posts(magic_number)
  #       Post.create(title: 'Change Posts.', body: Time.zone.now)
  #     end
  #   end

  #   def roundom_create_posts(magic_number)
  #     case magic_number
  #     when 1, 4, 7
  #       change_ten_posts
  #     when 2, 5, 8
  #       change_five_posts
  #     when 3, 6, 9
  #       change_two_posts
  #     end
  #   end

  #   def change_ten_posts
  #     10.times do |_i|
  #       Post.create(title: Faker::Book.title, body: Faker::Books::Dune.saying)
  #     end
  #   end

  #   def change_five_posts
  #     5.times do |_i|
  #       Post.create(title: Faker::Book.title, body: Faker::Books::Dune.saying)
  #     end
  #   end

  #   def change_two_posts
  #     2.times do |_i|
  #       Post.create(title: Faker::Book.title, body: Faker::Books::Dune.saying)
  #     end
  #   end
  # end
end
