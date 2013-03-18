require "test/unit"
require_relative "../extension/enumerable_ext"
require_relative "../lib/People/person"
require_relative "../lib/Reviews/request_review_command"
require_relative "../lib/Reviews/review_repository"
require_relative "../lib/Reviews/request_review_handler"
require_relative "../lib/People/person_repository"

class TestAskForReviewFromMyContacts < Test::Unit::TestCase
	def setup
		@reviewRepository = ReviewRepository.new
		@personRepository = PersonRepository.new
	end

	def test_ask_for_review_from_my_contacts
		givenIAmARegisteredPerson
		givenIHaveContacts
		givenIAmLoggedIn
		whenIAskContactsToReviewMe
		thenANewReviewItemWillBeAssignedToTheContacts
		thenIWillBeTheSubjectOfTheReviewItem
	end


	def givenIAmARegisteredPerson
		@person = Person.new('subject@email.com')
		@personRepository.save(@person)
	end

	def givenIAmLoggedIn
		@loggedInPerson = @person
	end

	def givenIHaveContacts
		person = Person.new('contact@email.com')
		@personRepository.save(person)
		@person.contacts << person
	end

	def whenIAskContactsToReviewMe
		command = RequestReviewCommand.new(@loggedInPerson.id, [@person.contacts.first.id])
		RequestReviewHandler.receive(command, @reviewRepository, @personRepository)
	end

	def thenANewReviewItemWillBeAssignedToTheContacts
		@reviewRepository.query.single do |review| 
			assert_equal(1, review.reviewers.count)
			review.reviewers.single {|reviewer| reviewer == @person.contacts.first}
		end
	end
	
	def thenIWillBeTheSubjectOfTheReviewItem
		@reviewRepository.query.single {|review| review.subject == @person}
	end
end