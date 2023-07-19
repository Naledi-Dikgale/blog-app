class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @user = current_user
    @comment = Comment.new(comment_params)
    @post = Post.find(params[:post_id])
    @comment.post = @post
    @comment.author = current_user
    if @comment.save
      redirect_to user_post_path(@user), notice: 'Comment created!'
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
