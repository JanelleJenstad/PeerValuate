module Enumerable
	def single(&pred)
		result = self.find_all(&pred)

		if result.one?
			return result.first
		end

		if result.count > 1
			raise "More than one element found"
		end

		raise "Element not found"
	end

	def singleOrDefault(&pred)
		result = self.find_all(&pred)

		if result.one?
			return result.first
		elsif not result.any?
			return nil
		end

		raise "More than one element found"
	end
end