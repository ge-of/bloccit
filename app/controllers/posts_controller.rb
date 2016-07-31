class PostsController < ApplicationController

  before_action :require_sign_in, except: :show

  before_action :authorize_admin_only, except: [:index, :show]

  before_action :authorize_moderator_only, only: [:create, :edit, :update]

  def show
    @post = Post.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.new
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.build(post_params)
    @post.user = current_user

    if @post.save
      @post.labels = Label.update_labels(params[:post][:labels])
      flash[:notice] = "Post was saved successfully."
      redirect_to [@topic, @post]
    else
      flash.now[:alert] = "There was an error saving the post. Please try again."
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end


  def destroy
    @post = Post.find(params[:id])

  # #8
    if @post.destroy
      flash[:notice] = "\"#{@post.title}\" was deleted successfully."
      redirect_to @post.topic
    else
      flash.now[:alert] = "There was an error deleting the post."
      render :show
    end
  end

  def update
    p 'looking for post with id ', params[:id]
    p Post.pluck(:id)
    @post = Post.find(params[:id])
    @post.assign_attributes(post_params)

    if @post.save
      @post.labels = Label.update_labels(params[:post][:labels])
      flash[:notice] = "Post was updated successfully."
      redirect_to [@post.topic, @post]
    else
      flash.now[:alert] = "There was an error saving the post. Please try again."
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def authorize_moderator_only
    post = Post.find(params[:id])
    unless current_user == post.user || current_user.moderator?
      flash[:alert] = "Need to be a mod. Try again."
      redirect_to [post.topic, post]
    end
  end

  def authorize_admin_only
    post = Post.find(params[:id])
# #11
    unless current_user == post.user || current_user.admin?
      flash[:alert] = "You must be an admin to do that."
      redirect_to [post.topic, post]
    end
  end
end
