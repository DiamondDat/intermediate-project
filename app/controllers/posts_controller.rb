class PostsController < ApplicationController
  before_action :posts_for_branch, only: %i[hobby study team]

  def show
    @post = Post.find(params[:id])
  end

  def hobby; end

  def study; end

  def team; end

  private

  def posts_for_branch
    @categories = Category.where(branch: params[:action])
    @posts = Post.limit(30).paginate(page: params[:page])

    respond_to do |format|
      format.html
      format.js { render partial: 'posts/posts_pagination_page' }
    end
  end

  def get_posts
    PostsForBranchService.new({
      search: params[:search],
      category: params[:category],
      branch: params[:action]
    }).call
  end
end
