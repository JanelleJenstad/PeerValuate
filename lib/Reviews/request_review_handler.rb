require_relative "review"

class RequestReviewHandler
	def self.receive(command, reviewRepository, personRepository)
		subject = personRepository.query.single {|p| p.id == command.subjectId }
		reviewers = personRepository.query.select {|p| command.contactsToInclude.include?(p.id)}

		review = Review.new(subject)

		reviewers.each {|reviewer| review.reviewers << reviewer }
				
		reviewRepository.save(review)
	end
end