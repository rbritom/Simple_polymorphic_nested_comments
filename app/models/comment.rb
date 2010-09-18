class Comment < ActiveRecord::Base
  belongs_to :commentable, :polymorphic => true
  acts_as_nested_set
  attr_accessible :author, :content, :commentable_type, :commentable_id, :parent_id, :lft, :rgt
end
