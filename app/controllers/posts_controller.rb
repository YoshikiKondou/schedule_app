class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
  end
  
  def new
    @post = Post.new
  end
  
  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end  
    
  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "投稿を作成しました"
      redirect_to :posts
    else
      flash[:failure] = "投稿を作成できませんでした"
      render :new
    end
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:success] = "投稿を更新しました"
      redirect_to :posts
    else
      flash[:failure] = "投稿を更新できませんでした"
      render :edit
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:success] = "投稿を削除しました"
    redirect_to :posts
  end
  
  private
  
  def post_params
    params.require(:post).permit(
    :title,
    :start_at,
    :end_at,
    :is_all_day,  
    :memo  
    )
  end
  
end
