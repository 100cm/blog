class Article < ActiveRecord::Base

  paginates_per 7
  acts_as_commentable


end
