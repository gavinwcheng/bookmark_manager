# require './data_mapper_setup'
# require 'data_mapper'

class Link
  include DataMapper::Resource

  property :id, Serial
  property :title, String
  property :url, String

end
