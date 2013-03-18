require_relative '../entity'

class Person < Entity
	attr_reader :contacts

	def initialize(emailAdress)
		super()

		@emailAdress = emailAdress
		@contacts = []
	end
end