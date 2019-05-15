require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:barbershop.db"

class Client < ActiveRecord::Base
	validates :name, presence:  true, length: {minimum: 3}
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
	@base = Client.new
	erb :visit
end

post '/visit' do
	@base = Client.new params[:client]
	if @base.save
		erb "Спасибо, Вы записались"
	else
		@error = @base.errors.full_messages.first
		erb :visit
	end	
end

get '/barber/:id' do
	@barber = Barber.find(params[:id])
	erb :barber
end

get '/bookings' do
	@clients = Client.all
	erb :bookings
end

get '/client/:id' do
	@client = Client.find(params[:id])
	erb :client
end