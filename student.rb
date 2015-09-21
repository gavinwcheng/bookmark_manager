require_relative 'data_mapper_setup'

class Student
  include DataMapper::Resource

  property :id, Serial
  property :name, String
end
