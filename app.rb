require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, {adapter: "postgresql", database: "Barbershop", user: "postgres"}

class Client < ActiveRecord::Base
end

class Barber < ActiveRecord::Base
end

before do
	@barbers = Barber.all
end

get '/' do
	erb :index
end

get '/visit' do 
	erb :visit
end

post '/visit' do
	c = Client.new params[:client]
	c.save

	erb "Спасибо, ждем Вас!"
end