class PersonRepository
	def initialize
		@people = []
	end

	def query
		return @people
	end

	def save(person)
		@people << person
	end
end