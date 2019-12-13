#!/usr/bin/ruby
require('./lib/ruby_project_creator.rb')
require 'fileutils'
require 'bundler'

puts "~~~~~ Welcome! ~~~~~"
ascii_gif1 = "
   .---.
 .'_:___'
 |__ --==|
 [  ]  :[|
 |__| I=[|
 / / ____|
|-/.____.'
/___| /___|
"

ascii_gif2 = "
             .---.
           .'_:___'
           |__ --==|
           [  ]  :[|
           |__| I=[|
           / / ____|
          |-/.____.'
          /___| /___|
"


ascii_gif3 = "
                       .---.
                     .'_:___'
                     |__ --==|
                     [  ]  :[|
                     |__| I=[|
                     / / ____|
                    |-/.____.'
                    /___| /___|
"

ascii_gif4 = "
                                 .---.
                               .'_:___'
                               |__ --==|
                               [  ]  :[|
                               |__| I=[|
                               / / ____|
                              |-/.____.'
                              /___| /___|
"

ascii_gif5 = "
                       .---.
                     .'_:___'
                     |__ --==|
                     [  ]  :[|
                     |__| I=[|
                     / / ____|
                    |-/.____.'
                    /___| /___|
"
ascii_gif6 = "
             .---.
           .'_:___'
           |__ --==|
           [  ]  :[|
           |__| I=[|
           / / ____|
          |-/.____.'
          /___| /___|
"



ascii_array = [ascii_gif1, ascii_gif2, ascii_gif3, ascii_gif4, ascii_gif5, ascii_gif6]

4.times do
  i = 1
  while i < 4
    system "clear"
    ascii_array.each do |p|
      system "clear"
      puts p
      sleep(0.1)
      i += 1
    end
  end
end


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

# File.write("Gemfile", "source 'https://rubygems.org'\n\n  gem 'rspec'\n  gem 'pry'\n  gem 'fileutils'", mode: "a")

File.write("Gemfile", "source 'https://rubygems.org'\n\n  gem 'rspec'\n  gem 'pry'\n  gem 'fileutils'", mode: "a")


puts "~~~~~ What should your first class be called? ~~~~~"
class_name = gets.chomp
puts "~~~~~ What should your first parameter be called? ~~~~~"
parameter_name = gets.chomp

File.write("lib/#{dir_name}_backend.rb", "class #{class_name.upcase}\n\n  # attr_reader(:)\n  # attr_writer(:)\n  attr_accessor(:#{parameter_name.downcase})\n\n  def initialize(#{parameter_name.downcase})\n    @#{parameter_name.downcase} = #{parameter_name.downcase}\n  end\n\nend", mode: "a")


Bundler.with_clean_env do
  `bundle install`
end
puts "~~~~~ bundle installed ~~~~~"

puts "~~~~~ would you like to create a new GitHub Repository? (y/n) ~~~~~"
gitHub_response = gets.chomp

if gitHub_response == "n"
  puts "~~~~~ Project completed! ~~~~~"
  return
elsif gitHub_response == "y"
else
  puts "~~~~~ Project completed! But GitHub aborted ~~~~~"
  return
end


system "git init"
system "git add ."
system "git commit -m 'initialize Ruby project'"
system "git init"
system "git init"

git commit -m "first commit"
git remote add origin git@github.com:alexpchin/<reponame>.git
git push -u origin master

puts "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
