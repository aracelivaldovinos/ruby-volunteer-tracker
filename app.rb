require('sinatra')
require('sinatra/reloader')
require('./lib/project')
require('pry')
also_reload('lib/**/*.rb')
require 'pg'

DB = PG.connect({:dbname => "project"})
