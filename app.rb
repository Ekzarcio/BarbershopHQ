require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:barbershop.db"

class Client < ActiveRecord::Base
	validates :name, presence:  true
	validates :phone, presence: true
	validates :datestamp, presence:  true
	validates :barber, presence:  true
	validates :color, presence:  true
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

	@base = Client.new params[:client]
	if @base.save
		erb erb "Спасибо, Вы записались"
	else
		@error = @base.errors.full_messages.first
		erb :visit
	end
	
end