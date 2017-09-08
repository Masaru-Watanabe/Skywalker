class Article < ActiveRecord::Base
 belongs_to :user
 has_many :pictures, dependent: :destroy
 default_scope -> { order(created_at: :desc) }
 validates :title, presence: true, length: { minimum: 5 } 
 mount_uploader :image, ImageUploader
end
