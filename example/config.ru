require 'sinatra'
require 'socialoud'
require './app'

set :public_folder, File.dirname(__FILE__) + '/public'
run Sinatra::Application
