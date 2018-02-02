require 'prime'
class RSA
   def initialize n, e, d
 	@n = n
	@e = e
	@d = d
   end
   
   def n
      return @n
   end
   
   def e
      return @e
   end
   
   def d
      return @d
   end
   
   def new_key
	resulted_values = Array.new
	p = rand(2500)
	q = rand(2500)
	
	while !Prime.prime?(p) 
		p = rand(2500)
	end
	while !Prime.prime?(q)
		q = rand(2500)
	end
	
	n = p*q

	resulted_values[0] = n
	phi = (p-1)*(q-1)
	
	e = rand(phi)
	
	while e.gcd(phi)!=1
		e = rand(phi)
	end
	
	resulted_values[1] = e
	
	d = rand(phi)
	while((d*e) % phi != 1)
		d = rand(phi)
	end
	
	return resulted_values
   end
   
   def encrypt message
	return (message.chars.map {|c| c.ord ** @e % @n}).join(",")
   end
   
   def decrypt message
	return (message.split(",").map {|c| (c.to_i ** @d % @n).chr}).join("")
   end 
end
