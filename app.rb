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
	@name = params[:name]
	@phone = params[:phone]
	@datestamp = params[:datestamp]
	@barber = params[:barber]

	Client.create :name => @name, :phone => @phone, :datestamp => @datestamp, :barber => @barber 

	erb "Ок, ждем Вас!"
end