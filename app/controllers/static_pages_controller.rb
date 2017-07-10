class StaticPagesController < ApplicationController
  def home
    if user_signed_in?
      @post = current_user.posts.build
      @posts = current_user.feed.select(:id, :title, :content, :picture, :user_id,
        :created_at).sort_by_created_at.paginate page: params[:page],
        per_page: Settings.posts.per_page
    else
      @posts = Post.sort_by_created_at.paginate page: params[:page], per_page: Settings.posts.max_post
    end
  end
end
