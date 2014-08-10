module Enumerable

	def my_each
		#Return an enumerable object if no block is given
		return enum_for(:my_each) unless block_given?
		#Ensure hashes are accepted by converting to arrays
		array=self.to_a
		hashed=false
		if self.is_a?(Hash)
			hashed=true
		end
		#performs main loop
		for i in 0...array.length
			yield(self[i])
		end
		return self.to_a if hashed==false
		return self
	end

	def my_each_with_index
		#Return an enumerable object if no block is given
		return enum_for(:my_each_with_index) unless block_given?
		#Ensure hashes are accepted by converting to arrays
		array=self.to_a
		hashed=false
		if self.is_a?(Hash)
			hashed=true
		end
		for i in 0...array.length
			yield(self[i],i)
		end
		return self.to_a if hashed==false
		return self
	end
end