#Advanced developers: Uncomment the following understand more about the RSpec "focus" filter
#require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

require 'string_calculator'

# The top of your testing block
# More examples of tests can be found here: https://github.com/rspec/rspec-expectations
RSpec.describe StringCalculator, "#add" do
  
  context "null value" do	
    it "returns 0 for empty string" do
      expect(StringCalculator.add("")).to eql(0)
    end
  end  
  
  context "single value" do	
    it "returns 0 for empty string" do
      expect(StringCalculator.add("0")).to eql(0)
    end
  
    it "returns 5 the string 5" do
      expect(StringCalculator.add("5")).to eql(5)
    end
  end  

  context "two values" do
  	it "returns 3 for the sting '1,2'" do 
  		expect(StringCalculator.add("1,2")).to eql(3)
  	end
  end	

  context "two values" do
  	it "returns 7 for the sting '//;\n2;5'" do 
  		expect(StringCalculator.add("//;\n2;5")).to eql(7)
  	end
  end	  	
  
  context "NEGS" do
  	it "returns error for the negative 1" do 
  		expect { StringCalculator.add("-1") } .to raise_error(RuntimeError)
  	end
  end

  context "negative" do
  	it "returns RuntimeError when negative numbers exist if more than 1 exist" do 
  		expect { StringCalculator.add("1,-1,-2") } .to raise_error(RuntimeError, "-1,-2")
  	end
  end  	

  context "large numbers" do
  	it "returns RuntimeError when number greater than 1000" do 
  		expect { StringCalculator.add("1001") } .to raise_error(RuntimeError)
  	end
  end    	

  # more tests go here
end
