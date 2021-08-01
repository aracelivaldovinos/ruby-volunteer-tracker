require('sinatra')
require('sinatra/reloader')
require('./lib/project')
require('./lib/volunteer')
require('pry')
also_reload('lib/**/*.rb')
require("pg")

DB = PG.connect({:dbname => "volunteer_tracker"})

get('/') do
  @projects = Project.all
  erb(:projects)
end

get('/projects') do
  @projects = Project.all
  erb(:projects)
end

get('/projects/:id') do 
  @project = Project.find(params[:id].to_i())
  erb(:project)
end 

post('/projects') do
  # binding.pry
  name = params[:title]
  project = Project.new({:title => name, :id => nil})
  project.save()
  @projects= Project.all()
  erb(:projects)
end 

get('/projects/:id/edit') do 
  # binding.pry
  @project = Project.find(params[:id].to_i())
  erb(:edit_project)
end 

patch('/projects/:id') do 
  @project = Project.find(params[:id].to_i())
  @project.update(params[:title])
  @projects = Project.all
  erb(:projects)
end 

delete('/projects/:id') do 
  @project = Project.find(params[:id].to_i())
  @project.delete()
  @projects = Project.all
  erb(:projects)
end 