module Enumerable

	def my_each
		#Ensures input is an array or hash
		raise TypeError unless (self.is_a? Array)||(self.is_a? Hash)
		#Return an enumerable object if no block is given
		return enum_for(:my_each) unless block_given?
		if self.is_a?(Array)
			for i in 0...self.length
				yield(self[i])
			end
		else
			for i in 0...self.keys.length
				key = self.keys[i]
				yield(key,self[key])
			end
		end
		return self
	end

	def my_each_with_index
		#Ensures input is an array or hash
		raise TypeError unless (self.is_a? Array)||(self.is_a? Hash)
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
		#Ensures input is an array or hash
		raise TypeError unless (self.is_a? Array)||(self.is_a? Hash)
		#Return an enumerable object if no block is given
		return enum_for(:my_select) unless block_given?
		if self.is_a?(Array)
			selected=[]
			self.my_each do |element|
				check=yield(element)
				selected<<element if check
			end
			return selected
		else
			selected={}
			self.my_each do |key,value|
				check=yield(key,value)
				selected[key]=value if check
			end
			return selected
		end
	end

	def my_all?
		#Ensures input is an array or hash
		raise TypeError unless (self.is_a? Array)||(self.is_a? Hash)
		#Return an enumerable object if no block is given
		return enum_for(:my_all?) unless block_given?
		if self.is_a?(Array)
			selected = self.my_select do |element|
				yield(element)
			end
			compare=self==selected
			return compare
		else
			selected = self.my_select do |key,value|
				yield(key,value)
			end
			compare=self==selected
			return compare
		end
	end

	def my_any?
		#Ensures input is an array or hash
		raise TypeError unless (self.is_a? Array)||(self.is_a? Hash)
		#Return an enumerable object if no block is given
		return enum_for(:my_any?) unless block_given?
		if self.is_a?(Array)
			selected = self.my_select do |element|
				yield(element)
			end
			return selected.length>0
		else
			selected = self.my_select do |key,value|
				yield(key,value)
			end
			return selected.length>0
		end
	end

	def my_none?
		#Ensures input is an array or hash
		raise TypeError unless (self.is_a? Array)||(self.is_a? Hash)
		#Return an enumerable object if no block is given
		return enum_for(:my_none?) unless block_given?
		if self.is_a?(Array)
			selected = self.my_select do |element|
				yield(element)
			end
			return selected.length==0
		else
			selected = self.my_select do |key,value|
				yield(key,value)
			end
			return selected.length==0
		end
	end

	def my_count
		#Ensures input is an array or hash
		raise TypeError unless (self.is_a? Array)||(self.is_a? Hash)
		unless block_given?
			return self.length
		else
			if self.is_a? Array
				selected=self.my_select do |element|
					yield(element)
				end
				return selected.length
			else
				selected=self.my_select do |key,value|
					yield(key,value)
				end
				return selected.length
			end
		end
	end

	def my_map(in_proc)
		#Ensures input is an array or hash
		raise TypeError unless (self.is_a? Array)||(self.is_a? Hash)
		if self.is_a?(Array)
			selected=[]
			self.my_each do |element|
				selected<<in_proc.call(element)
			end
			if block_given?	
				selected2=[]
				selected.my_each do |element|
					selected2<<yield(element)
				end
				return selected2
			end
			return selected
		else
			selected=[]
			self.my_each do |key,value|
				selected<<in_proc.call(key,value)
			end
			if block_given?	
				selected2=[]
				selected.my_each do |element|
					selected2<<yield(element)
				end
				return selected2
			end
			return selected
		end
	end

	def my_inject(*args)
		#Ensures input is an array or hash
		raise TypeError unless (self.is_a? Array)||(self.is_a? Hash)
		if args.length==0
			array=self.to_a
			base=array[0]
			array[1..-1].my_each do |element|
				base=yield(base,element)
			end
			return base
		else
			array=self.to_a
			base=args[0]
			array[0..-1].my_each do |element|
				base=yield(base,element)
			end
			return base
		end
	end
end


def multiply_els(array)
	array.my_inject {|base,element| base*element}
end