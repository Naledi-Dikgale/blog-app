class CommentsController < ApplicationController
  load_and_authorize_resource
  def new
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.author = @user
    if @comment.save
      redirect_to user_post_path(@user, @post), notice: 'Comment created!'
    else
      flash.now[:errors] = 'Invalid comment!'
      render :new
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    if @comment.destroy
      redirect_to user_post_path(@user, @post), notice: 'Comment deleted!'
    else
      redirect_to user_post_path(@user, @post), alert: 'OOPSY Daisy!'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
