require 'rubygems'
begin
  require "vlad"
  Vlad.load(:scm => :git, :app => nil, :web => nil)
rescue LoadError
end

