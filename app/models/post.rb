class Post < ActiveRecord::Base
	belongs_to :user
	validates :post_text, length: { minimum: 1 }
	validates :title, presence: true

end
