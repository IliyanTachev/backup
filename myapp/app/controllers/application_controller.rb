class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_sessions
  require 'csv'
  def sums
	content=params["file"].read 
	arr=CSV.parse(content,converters: :numeric)
	sum=0
	for i in 0..arr.length - 1
	    sum+=arr[i][0]
	end
	render plain: "%.2f" % sum.ceil	
  end
  def filters
	content=params["file"].read
        arr=CSV.parse(content,converters: :numeric)
        sum=0
        for i in 0..arr.length - 1
            if arr[i][2] % 2 != 0 
		sum+= arr[i][1]
            end
	end
        render plain: "%.2f" % sum.ceil
  end 
  def intervals
	content=params["file"].read
        arr=CSV.parse(content,converters: :numeric)
        max_sum=0
        for i in 0..arr.length-30
	   sum=0
	   for k in 0..29
	   sum+=arr[k+i][0]
	   end
	   if max_sum<sum
	   max_sum=sum
	   end
        end
 render plain: "%.2f" % max_sum.ceil
end
end

