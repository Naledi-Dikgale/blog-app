class Api::V1::PostsController < ApplicationController
  skip_before_action :authenticate_user!
  protect_from_forgery with: :null_session

  def index
    @posts = Post.includes(:author).where(author_id: params[:user_id])
    @user = User.find(params[:user_id])

    if @posts
      render json: { status: 'Success', message: 'Bravo!', data: @posts }, status: :ok
    else
      render json: { status: 'Error', message: 'OOPSY Daisy!', errors: @posts.errors }, status: :bad_request
    end
  end
end
