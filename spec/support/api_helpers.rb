module ApiHelpers

  def json
    JSON.parse(response.body)
  end

  def login_with_api(user)
    post user_session_path, params: {
      email: user.email,
      password: user.password
    }
  end

end