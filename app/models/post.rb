class Post < ActiveRecord::Base
belongs_to :user
validates length: { minimum: 1 }
validates :title, presence: true


end
