require 'sinatra'
require 'sinatra/reloader'
require 'active_record'

# ActiveRecord::Base.logger = Logger.new(STDOUT)

# ActiveRecord::Base.establish_connection(
# 	adapter: 'postgresql',
# 	host: 'localhost',
# 	database: 'bucket_db'
# )

# class Item < ActiveRecord::Base
# end

get '/' do
	redirect '/multiple/5/25/0433ff'
end

get '/multiple/?:num?/?:roundness?/?:color?' do
	@color = params[:color]
	@color ||= "blue"
	@break_num = 5
	@roundness = params[:roundness].to_i
	@roundness ||= 0
	@num_squares = params[:num].to_i

	return erb :index
end

post '/multiple' do
	@num_squares = params[:numsquares]
	@roundness = params[:roundness]
	@color = params[:color].gsub("#", "")
	
	@num_squares ||= 0

	redirect "/multiple/#{@num_squares}/#{@roundness}/#{@color}"
end