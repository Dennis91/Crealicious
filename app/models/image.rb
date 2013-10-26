class Image < ActiveRecord::Base
  belongs_to :case
  
  mount_uploader :image, ImageUploader
  

end
