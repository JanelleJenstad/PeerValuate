require "SecureRandom"

class Entity
	attr_reader :id

	def initialize
		@id = SecureRandom.uuid
	end
end