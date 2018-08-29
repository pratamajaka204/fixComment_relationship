class Article < ApplicationRecord
	validates :title, presence: true,
						length: { minimum: 5 }
	validates :content, presence: true,
						length: { minimum: 10 }
	validates :status, presence: true

	scope :status_active, -> {where(status: 'active')}
	default_scope {where(status: 'active')}

	#name relation must plural
	has_many :comments, dependent: :destroy

	# Article.create(title: "learn", content: "asd", status: "not active")
	# Article.last.comments.create([{content:"coment 1"},{content: "coment2"}])
end
