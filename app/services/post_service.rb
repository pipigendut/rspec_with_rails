class PostService
  Result = Struct.new(:success?, :errors, :value)

  def get_posts(user)
    Result.new(true, [], user.posts)
  rescue StandardError => e
    Result.new(false, e, nil)
  end

  def get_post_by_id(user, params)
    Result.new(true, [], user.posts.find_by(id: params[:id]))
  rescue StandardError => e
    Result.new(false, e, nil)
  end

  def create_post(user, params)
    post = Post.new(params)
    user.posts << post
    user.save!

    Result.new(true, [], post)
  rescue StandardError => e
    Result.new(false, e, nil)
  end
  
end