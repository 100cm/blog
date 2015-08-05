class PostImage < ActiveRecord::Base
  belongs_to :article

  mount_uploader :image, PostImageUploader
end
