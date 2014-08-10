require "enumerable"

describe "create enumerables" do
	#my_each
	it "each array puts" do
		expect([1,2,3].my_each {|i| puts i}).to eq([1,2,3].each {|i| puts i})
	end
	it "each hash puts" do
		expect({thing: 5,thing2: "hi",thing3: :bob,thing4: false}.my_each {|i| puts i}).to eq({thing: 5,thing2: "hi",thing3: :bob,thing4: false}.each {|i| puts i})
	end
	#my_each_with_index
	it "each array puts with index" do
		expect([1,2,3].my_each_with_index {|i,index| puts i+index}).to eq([1,2,3].each_with_index {|i,index| puts i+index})
	end
	it "each hash puts with index" do
		expect({thing: 5,thing2: "hi",thing3: :bob,thing4: false}.my_each_with_index {|i,index| puts i}).to eq({thing: 5,thing2: "hi",thing3: :bob,thing4: false}.each_with_index {|i,index| puts i})
	end
	#my_select
	it "select array greater than 5" do
		expect([1,2,3,4,5,6,7,8,9,10].my_select {|i| i>5}).to eq([1,2,3,4,5,6,7,8,9,10].select {|i| i>5})
	end
	it "select hash greater than 5" do
		expect({thing: 1, "bob" => 2, 3 => 3, ["woah",5] => 4, 435 => 5, 234 => 6, 2324 =>7}.my_select {|key,value| value>5}).to eq({thing: 1, "bob" => 2, 3 => 3, ["woah",5] => 4, 435 => 5, 234 => 6, 2324 =>7}.select {|key,value| value>5})
	end
	#my_all?
	it "select array greater than 5" do
		expect([1,2,3,4,5,6,7,8,9,10].my_all? {|i| i>5}).to eq([1,2,3,4,5,6,7,8,9,10].all? {|i| i>5})
	end
	it "select hash greater than 5" do
		expect({thing: 1, "bob" => 2, 3 => 3, ["woah",5] => 4, 435 => 5, 234 => 6, 2324 =>7}.my_all? {|key,value| value>5}).to eq({thing: 1, "bob" => 2, 3 => 3, ["woah",5] => 4, 435 => 5, 234 => 6, 2324 =>7}.all? {|key,value| value>5})
	end
	#my_any?
	it "select array greater than 5" do
		expect([1,2,3,4,5,6,7,8,9,10].my_any? {|i| i>5}).to eq([1,2,3,4,5,6,7,8,9,10].any? {|i| i>5})
	end
	it "select hash greater than 5" do
		expect({thing: 1, "bob" => 2, 3 => 3, ["woah",5] => 4, 435 => 5, 234 => 6, 2324 =>7}.my_any? {|key,value| value>5}).to eq({thing: 1, "bob" => 2, 3 => 3, ["woah",5] => 4, 435 => 5, 234 => 6, 2324 =>7}.any? {|key,value| value>5})
	end
	#my_none?
	it "select array greater than 5" do
		expect([1,2,3,4,5,6,7,8,9,10].my_none? {|i| i>5}).to eq([1,2,3,4,5,6,7,8,9,10].none? {|i| i>5})
	end
	it "select hash greater than 5" do
		expect({thing: 1, "bob" => 2, 3 => 3, ["woah",5] => 4, 435 => 5, 234 => 6, 2324 =>7}.my_none? {|key,value| value>5}).to eq({thing: 1, "bob" => 2, 3 => 3, ["woah",5] => 4, 435 => 5, 234 => 6, 2324 =>7}.none? {|key,value| value>5})
	end
	#my_count
	it "select array greater than 5" do
		expect([1,2,3,4,5,6,7,8,9,10].my_count {|i| i>5}).to eq([1,2,3,4,5,6,7,8,9,10].count {|i| i>5})
	end
	it "select hash greater than 5" do
		expect({thing: 1, "bob" => 2, 3 => 3, ["woah",5] => 4, 435 => 5, 234 => 6, 2324 =>7}.my_count {|key,value| value>5}).to eq({thing: 1, "bob" => 2, 3 => 3, ["woah",5] => 4, 435 => 5, 234 => 6, 2324 =>7}.count {|key,value| value>5})
	end
	#my_map
	it "add 3" do
		expect([1,2,3,4,5,6,7,8,9,10].my_map {|i| i+3}).to eq([1,2,3,4,5,6,7,8,9,10].map{|i| i+3})
	end
	it "add 5" do
		expect({thing: 1, "bob" => 2, 3 => 3, ["woah",5] => 4, 435 => 5, 234 => 6, 2324 =>7}.my_map {|key,value| value+5}).to eq({thing: 1, "bob" => 2, 3 => 3, ["woah",5] => 4, 435 => 5, 234 => 6, 2324 =>7}.map {|key,value| value+5})
	end
	#my_inject
	it "add all" do
		expect([1,2,3,4,5,6,7,8,9,10].my_inject {|base,i| base+i}).to eq([1,2,3,4,5,6,7,8,9,10].inject{|base,i| base+i})
	end
	it "print base" do
		expect({thing: 1, "bob" => 2, 3 => 3, ["woah",5] => 4, 435 => 5, 234 => 6, 2324 =>7}.my_inject {|base,element| puts base}).to eq({thing: 1, "bob" => 2, 3 => 3, ["woah",5] => 4, 435 => 5, 234 => 6, 2324 =>7}.inject {|base,element| puts base})
	end
	it "add all to 3" do
		expect([1,2,3,4,5,6,7,8,9,10].my_inject(3) {|base,i| base+i}).to eq([1,2,3,4,5,6,7,8,9,10].inject(3) {|base,i| base+i})
	end
	#multiply_els
	it "multiply all" do
		expect(multiply_els([2,3,4])).to eq(24)
	end
end
