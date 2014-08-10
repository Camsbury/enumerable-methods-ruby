module Enumerable

	def my_each
		#Return an enumerable object if no block is given
		return enum_for(:my_each) unless block_given?
		if self.is_a?(Array)
			for i in 0...self.length
				yield(self[i])
			end
		elsif self.is_a?(Hash)
			for i in 0...self.keys.length
				key = self.keys[i]
				value = self.values[i]
				yield(key,self[key])
			end
		end
		return self
	end

	def my_each_with_index
		#Return an enumerable object if no block is given
		return enum_for(:my_each_with_index) unless block_given?
		#Ensure hashes are accepted by converting to arrays
		array=self.to_a
		#performs main loop
		for i in 0...array.length
			yield(array[i],i)
		end
		return self
	end

	def my_select
		#Return an enumerable object if no block is given
		retrun enum_for(:my_select) unless block_given?
	end

end