class Listing < ActiveRecord::Base
  mount_uploaders :images, ImageUploader
  acts_as_taggable # Alias for acts_as_taggable_on :tags
  has_many :reservations, :dependent => :destroy
  belongs_to :user

  
end
