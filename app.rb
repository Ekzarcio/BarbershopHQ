require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, {adapter: "postgresql", database: "Barbershop", user: "postgres"}

class Client < ActiveRecord::Base
	validates :name, presence: true
	validates :phone, presence: true
	validates :datestamp, presence: true
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
	if 	c.save
		erb "Спасибо, ждем Вас!"
	else
		@error = c.errors.full_messages.first
		erb :visit
	end
end