require('pry')

class Project
attr_reader :id 
attr_accessor :title 

  def initialize(attributes)
    @title = attributes.fetch(:title)
    @id = attributes.fetch(:id)
  end 

  def title
    @title
  end 

  def id 
    @id 
  end 

  def self.all
    returned_projects = DB.exec("SELECT * FROM projects")
    projects = []
    returned_projects.each do |project|
      title = project.fetch("name")
      id = project.fetch("id").to_i
      projects.push(Project.new({:title => title, :id => id}))
    end 
    projects
  end 

  def ==(compare_title)
    # binding.pry
    self.title == (compare_title.title)
  end 
 


end 


