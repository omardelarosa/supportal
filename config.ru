require 'rubygems'
require 'bundler'
require 'sass/plugin/rack'
Bundler.require
 
Sass::Plugin.options[:template_location] = 'public/sass'
Sass::Plugin.options[:css_location] = 'public/css'
use Sass::Plugin::Rack

require './supportal.rb'
run Supportal
