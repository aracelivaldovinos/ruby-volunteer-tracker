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


end 