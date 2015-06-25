module StringCalculator

  def self.add(string)
  	values = extract_values(string)
  	negatives = extract_negatives(string)
  	large = extract_large(string)
  	throw_negative_errors(negatives) unless negatives.empty?
  	throw_large_errors(large) unless large.empty?
  	values.reduce(:+) || 0 
  end 

  def self.extract_values(string)
    delimiter =  extract_delimiter(string)
  	string.split(/[{#{delimiter},\n]/).map(&:to_i)	  	
  end	

  def self.extract_delimiter(string)
  	string =~ /^\/\// ? string[2] : ","
  end	

  def self.extract_negatives(string)
  	extract_values(string).select { |v| v < 0 }
  end

  def self.extract_large(string)
  	extract_values(string).select { |v| v > 1000 }
  end  
  	
  def self.throw_negative_errors(negatives)
  	if negatives.length > 1
  		raise negatives.join(",")
  	else
  		raise RuntimeError
  	end		  			
  end	
  
  def self.throw_large_errors(large)
  	if large.length > 1
  		raise large.join(",")
  	else
  		raise RuntimeError
  	end		  			
  end	
end
