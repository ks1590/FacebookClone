class Post < ApplicationRecord
	validates :title, presence: true
	validates :content, presence: true
	mount_uploader :image, ImageUploader
	belongs_to :user
end
