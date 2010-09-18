class Article < ActiveRecord::Base
  has_many :comments, :as => :commentable

  attr_accessible :title, :body
end
