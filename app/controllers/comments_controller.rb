class CommentsController < ApplicationController
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
    @commentdel = Comment.includes(:post).find(params[:id])
    @post = @commentdel.post

    if @commentdel.destroy
      flash[:notice] = 'Comment deleted!'
    else
      flash.now[:errors] = 'Unable to delete comment!'
    end
    redirect_to user_post_path(@post.author, @post)
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
