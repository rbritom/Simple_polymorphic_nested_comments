class Proyect < ActiveRecord::Base
  has_many :comments, :as => :commentable

  attr_accessible :name, :description
end
