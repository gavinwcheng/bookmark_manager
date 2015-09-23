require 'data_mapper'
require './app/models/link'
require './app/models/tag'

env = ENV['RACK_ENV'] || 'development'

if ENV['RACK_ENV'] == 'production'
  DataMapper.setup(:default, ENV['DATABASE_URL'])
else
  DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{env}")
end

DataMapper.finalize

DataMapper.auto_upgrade!
