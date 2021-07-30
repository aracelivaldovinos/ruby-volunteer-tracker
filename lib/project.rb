require('pry')

class Project
attr_reader :id 
attr_accessor :title 

def initialize(attributes)
  @title = attributes.fetch(:title)
  @id = attributes.fetch(:id)
end 

def ==(compare_title)
  # binding.pry
  self.title == (compare_title.title)
end 


end 


