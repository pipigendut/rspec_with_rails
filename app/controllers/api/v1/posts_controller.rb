class Api::V1::PostsController < ApiController
  before_action :authenticate_user!
  
  def index
    result = PostService.new.get_posts(current_user)
    raise result.errors unless result.success?

    render SuccessFormatter.call(result.value)
  end

  def show
    result = PostService.new.get_post_by_id(current_user, params)
    raise result.errors unless result.success?

    render SuccessFormatter.call(result.value)
  end

  def create
    result = PostService.new.create_post(current_user, post_params)
    raise result.errors unless result.success?

    render SuccessFormatter.call(result.value)
  end

  private

  def post_params
    params.require(:post).permit(:title, :detail)
  end
end