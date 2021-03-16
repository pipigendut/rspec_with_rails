class Post
  include Mongoid::Document
  include Mongoid::Timestamps
  
  belongs_to :user

  field :title, type: String
  field :detail, type: String
end
