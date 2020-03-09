class CommentsController < ApplicationController

  def kurt
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)

    if @comment.save
      redirect_to @post
    else
      @comments =  @post.comments.all
      render 'posts/show'
    end
  end

  def index
    @post = Post.find(params[:post_id])
    redirect_to  @post
  end

  private

  def comment_params
      params.require(:comment).permit(:body)
  end
end
