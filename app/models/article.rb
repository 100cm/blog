class Article < ActiveRecord::Base

  paginates_per 10
  acts_as_commentable


end
