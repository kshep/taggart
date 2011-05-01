class User
  include MongoMapper::Document
  key :name, String
  key :text, String
  key :created, Time
end
