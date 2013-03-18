class ReviewRepository
	def initialize
		@entities = []
	end

	def query
		return @entities
	end

	def save(item)
		@entities << item
	end
end