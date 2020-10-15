require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, {adapter: "postgresql", database: "Barbershop", port: "5432", user: "postgres", password: "P123#dfr"}

class Client < ActiveRecord::Base

end



get '/' do
	erb "Hello"
end