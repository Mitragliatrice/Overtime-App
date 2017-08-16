class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update, :destroy]

    def index
        @posts = Post.all
    end

    def new
        @post = Post.new
    end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to @post, :notice => "Post created successfully."
    else 
      render :new, :notice => "There was an error, post not created."
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post, :notice => "Post updated successfully."
    else
      render :edit, :notice => "There was an error, post not updated."
    end
  end

  def show
  end

  def destroy
    if @post.destroy
      redirect_to posts_path, :notice => "Successfully deleted a post.."
    else
      render posts_path, :notice => "There was an error, post not deleted."
    end
  end

  private
  def post_params
    (params.require(:post).permit(:date, :rationale))
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
