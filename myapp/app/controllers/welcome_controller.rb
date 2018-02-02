class WelcomeController < ApplicationController
require 'csv' 
def index
     file_name=params[:file]   
     csv_text = File.read('file_name')
     csv_text.save
     csv = CSV.parse(csv_text, :headers => true)
     csv.each do |row|
     Moulding.create!(row.to_hash)
     puts row[0]     
     end
end
  
end
