class PostsController < ApplicationController

  before_action :load_promoted, only: [ :index ]
  before_action :load_normal, only: [ :index ]
  before_action :load_post, only: [ :visit, :promote_post ]
  
  def index    
  end

  def visit      
    if @post.present?
      @post.clicks -= 1 if @post.clicks > 0
      @post.promote = false if @post.clicks == 0
      @post.save
    end
    redirect_to :action => "index"
    #render nothing: true   # If planned to do with Ajax call, render json
  end

  def promote_post    
    if @post.present?
      @post.clicks = params[:click_count] if params[:click_count].present?
      @post.promote = true
      @post.save
    end
    redirect_to :action => "index"
    #render nothing: true   # If planned to do with Ajax call, render json
  end


  private

  def load_promoted
    @promoted = Post.promoted_posts
  end

  def load_normal
    @normal = Post.normal_posts
  end

  def load_post
    @post = Post.find_by_id(params[:id]) if params[:id].present?
  end

end
