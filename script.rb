#!/usr/bin/ruby
require('./lib/ruby_project_creator.rb')
require 'fileutils'
require 'bundler'

puts "~~~~~ Welcome! ~~~~~"
puts "    .---."
puts "  .'_:___'"
puts "  |__ --==|"
puts "  [  ]  :[|"
puts "  |__| I=[|"
puts "  / / ____|"
puts " |-/.____.'"
puts "/___| /___|"
puts "~~~~~ What should your new directory be called? ~~~~~"
dir_name = gets.chomp

FileUtils.cd('..', :verbose => true)
FileUtils.mkdir(dir_name, :verbose => true)
FileUtils.cd(dir_name, :verbose => true)
FileUtils.mkdir('lib', :verbose => true)
FileUtils.mkdir('spec', :verbose => true)

FileUtils.touch("lib/#{dir_name}_backend.rb")
FileUtils.touch("spec/#{dir_name}_backend_spec.rb")
FileUtils.touch("#{dir_name}_script.rb")

FileUtils.touch('Gemfile')
FileUtils.touch('Readme.md')

File.write("Gemfile", "source 'https://rubygems.org'\n\n  gem 'rspec'\n  gem 'pry'\n  gem 'fileutils'", mode: "a")

puts "~~~~~ What should your first class be called? ~~~~~"
class_name = gets.chomp
puts "~~~~~ What should your first parameter be called? ~~~~~"
parameter_name = gets.chomp

File.write("lib/#{dir_name}_backend.rb", "class #{class_name.upcase}\n\n  # attr_reader(:)\n  # attr_writer(:)\n  attr_accessor(:#{parameter_name.downcase})\n\n  def initialize(#{parameter_name.downcase})\n    @#{parameter_name.downcase} = #{parameter_name.downcase}\n  end\n\nend", mode: "a")


Bundler.with_clean_env do
  `bundle install`
end
