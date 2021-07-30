require('pry')
class Volunteer
attr_reader :id, :project_id
attr_accessor :name, :hours

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @hours = attributes.fetch(:hours)
    @project_id = attributes.fetch(:project_id)
    @id = attributes.fetch(:id)
  end
  
  def name
    @name
  end 

  def project_id
    @project_id
  end 

  def ==(compare_name)
    self.name == compare_name.name
  end 

  def self.all 
    volunteers = []
    returned_volunteers = DB.exec("SELECT * FROM volunteers;")
    returned_volunteers.each do |volunteer| 
      name = volunteer.fetch("name")
      hours = volunteer.fetch("hours").to_f
      project_id = volunteer.fetch("project_id").to_i
      id = volunteer.fetch("id").to_i
      volunteers.push(Volunteer.new({:name => name, :hours => hours, :project_id => project_id, :id => id}))
    end 
    volunteers
  end 

  def save 
    result = DB.exec("INSERT INTO volunteers (name, hours, project_id) VALUES ('#{@name}', #{@hours},#{@project_id}) RETURNING id;")
    @id = result.first.fetch("id").to_i
  end 

  def self.find(id)
    project = DB.exec("SELECT * FROM volunteers WHERE id = #{id}").first
    name = project.fetch("name")
    hours = project.fetch("hours").to_f
    project_id = project.fetch("project_id").to_i
    id = project.fetch("id").to_i
    Volunteer.new({:name => name, :hours => hours, :project_id => project_id, :id => id})
  end 


end 