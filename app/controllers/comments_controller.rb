class CommentsController < ApplicationController
def new
  @post = Post.find(params[:post_id])
end
def create
  @post = Post.find(params[:post_id])
  @comment = @post.comments.create(params[:comment].permit(:name, :body))
  if @comment.save
    redirect_to post_path(@post)
  else
    redirect_to post_path(@post)
    flash[:error] = "Fill in comment body"
  end
end
def destroy
  @post = Post.find(params[:post_id])
  @comment = @post.comments.find(params[:id])
  @comment.destroy
  redirect_to post_path(@post)
end
def index
  @posts = Post.all
  @comments = @post.comments.paginate(page: params[:page])
end
end
