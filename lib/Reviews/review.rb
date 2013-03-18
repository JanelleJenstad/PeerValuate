class Review
	attr_reader :reviewers
	attr_reader :subject
	
	def initialize(subject)
		@reviewers = []
		@subject = subject
	end
end