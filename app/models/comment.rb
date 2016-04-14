class Comment < ActiveRecord::Base
	has_many :replies, dependent: :destroy
	belongs_to :article
	belongs_to :user
	validates_presence_of :content
end
