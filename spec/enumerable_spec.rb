require "enumerable"

describe "create enumerables" do
	it "each array puts" do
		expect([1,2,3].my_each {|i| puts i}).to eq([1,2,3].each {|i| puts i})
	end
	it "each hash puts" do
		expect({thing: 5,thing2: "hi",thing3: :bob,thing4: false}.my_each {|i| puts i}).to eq({thing: 5,thing2: "hi",thing3: :bob,thing4: false}.each {|i| puts i})
	end
	it "each array puts" do
		expect([1,2,3].my_each_with_index {|i,index| puts i+index}).to eq([1,2,3].each_with_index {|i,index| puts i+index})
	end
	it "each hash puts" do
		expect({thing: 5,thing2: "hi",thing3: :bob,thing4: false}.my_each_with_index {|i,index| puts i}).to eq({thing: 5,thing2: "hi",thing3: :bob,thing4: false}.each_with_index {|i,index| puts i})
	end
end
