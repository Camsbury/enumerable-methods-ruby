module Enumerable

	def my_each
		#Return an enumerable object if no block is given
		return enum_for(:my_each) unless block_given?
		#Ensure hashes are accepted by converting to arrays
		array=self.to_a
		#performs main loop
		for i in 0...array.length
			yield(array[i])
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