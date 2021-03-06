class PostsController < ApplicationController
before_action :authenticate_user!, except: [:index, :show]
def index
  @posts = Post.paginate(:page => params[:page], :per_page => 10)
  # @posts = Post.all.order('created_at DESC')
end
def new
  @post = Post.new
end
def create
  @post = current_user.posts.new(post_params)
  if @post.save
    redirect_to @post
  else
    render "new"
  end
end
def show
  @post = Post.find(params[:id])
  @comments = @post.comments.paginate(page: params[:page], :per_page => 1)
end
def edit
  @post = Post.find(params[:id])
end
def update
  @post = Post.find(params[:id])
  if @post.update(params[:post].permit(:title, :body))
    redirect_to @post
  else
    render "edit"
  end
end
def destroy
  @post = Post.find(params[:id])
  @post.destroy
  redirect_to root_path
end
private
  def post_params
    params.require(:post).permit(:title, :body)
  end
end
