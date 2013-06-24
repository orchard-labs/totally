require 'mongoid'

class Apple
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String
  field :description, type: String
  field :tags, type: Array
  field :url, type: String
  field :media_type, type: String
end
