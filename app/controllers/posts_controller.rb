class PostsController < ApplicationController


before_action :set_post, only: %i[edit update destroy]

  def index
    @posts = Post.all
  end



    def new
      @post = Post.new
    end
      def create
        @post = Post.new(post_params)

        if @post.save
          redirect_to posts_path, notice: 'Create Post.'
        else
          flash.now[:danger] = 'Error: Not Create Post.'
          render :new
        end
      end



    def edit
    end
      def update
        if @post.update(post_params)
          redirect_to posts_path, success: 'Update Post.'
        else
          flash.now[:danger] = 'Error: Not Update Post.'
          render :edit
        end
      end



        def destroy
          @post.destroy!
          redirect_to posts_path, success: 'Delete Post.'
        end



private
def set_post
  @post = Post.find(params[:id])
end

def post_params
  params.require(:post).permit(:title, :body)
end
end
