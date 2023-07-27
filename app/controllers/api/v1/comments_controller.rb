class Api::V1::CommentsController < ApplicationController
  skip_before_action :authenticate_user!
  protect_from_forgery with: :null_session

  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments

    if @comments
      render json: { status: 'Success', message: 'Comment fetched successfully', data: @comments }, status: :ok
    else
      render json: { status: 'Error', message: 'No comments found!', data: @comments.errors },
             status: :bad_request
    end
  end

  def create
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @comments = @post.comments.new(comment_params)
    @comments.post_id = @post.id
    @comments.author_id = @user.id

    if @comments.save
      render json: { status: 'Success', message: 'Comment Created', data: @comments }, status: :ok
    else
      render json: { status: 'Not Found', message: 'Details not found', data: @comments.errors },
             status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
