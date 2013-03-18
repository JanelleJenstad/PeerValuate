class RequestReviewCommand
	attr_reader :subjectId, :contactsToInclude

	def initialize(subjectId, contactsToInclude)
		@subjectId = subjectId
		@contactsToInclude = contactsToInclude
	end

end