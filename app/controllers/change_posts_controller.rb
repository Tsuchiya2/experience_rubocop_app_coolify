class ChangePostsController < ApplicationController
  def create
    Post.transaction do
      magic_number = (1...9).to_a.sample
      Post.destroy_all
      # roundom_create_posts(magic_number) # Rubocop の  Metrics/AbcSize, Metrics/MethodLengthを解消するのに使用してください
      case magic_number
      when 1, 4, 7
        10.times do |_i|
          Post.create(title: Faker::Book.title, body: Faker::Books::Dune.saying)
        end
      when 2, 5, 8
        5.times do |_i|
          Post.create(title: Faker::Book.title, body: Faker::Books::Dune.saying)
        end
      when 3, 6, 9
        2.times do |_i|
          Post.create(title: Faker::Book.title, body: Faker::Books::Dune.saying)
        end
      end
      Post.create(title: 'Change Posts.', body: Time.zone.now)
    end
    # ===== 以下の redirect_to の記載は固定 =====
    redirect_to root_path, success: 'Try All Change Posts.'
  end

  # private

  # def roundom_create_posts(magic_number)
  #   case magic_number
  #   when 1, 4, 7
  #     change_ten_posts
  #   when 2, 5, 8
  #     change_five_posts
  #   when 3, 6, 9
  #     change_two_posts
  #   end
  # end

  # def change_ten_posts
  # end

  # def change_five_posts
  # end

  # def change_two_posts
  # end
end
