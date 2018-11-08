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
  end

  def get_posts
    branch = params[:action]
    search = params[:search]
    category = params[:category]

    if category.blank? && search.blank?
      posts = Post.by_branch(branch).all
    elsif category.blank? && search.present?
      posts = Post.by_branch(branch).search(search)
    elsif category.present? && search.blank?
      posts = Post.by_category(branch, category)
    elsif category.present? && search.present?
      posts = Post.by_category(branch, category).search(search)
    end
  end
end
