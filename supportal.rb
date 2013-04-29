require 'sinatra'
require 'curb'
require 'json'
require 'zendesk_api'
require 'erb'
require 'sass'

class Supportal < Sinatra::Base

  set :public_folder, './public'
  set :static, true
  set :root, File.dirname(__FILE__)

  attr_accessor :topics, :forums, :search_results, :client

  require './zendesk_config.rb'

  client = ZendeskAPI::Client.new do |config|

    zendesk_config(config)
    
  end

  get '/' do
    erb :home
  end

  get '/home' do
    redirect '/'
  end

  get '/nav' do
    
    @topics = client.topics.fetch
    @forums = client.forums.fetch

    erb :nav
  end

  get '/search/:queryinput' do |q|
  	@search_results = client.search(:query => q).fetch
    erb :search_results

  end

  get '/forums' do
  	client.forums.fetch.to_json
  end

  get '/topics' do
  	client.topics.fetch.to_json
  end

  get '/topic/:num' do
    redirect '/search/#{:num}'
  	#client.topic.find(:id=>params[:num]).to_json
  end

  get '/entries/:id' do
    redirect '/?'+params[:id]
  end

end