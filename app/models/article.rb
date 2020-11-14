class Article < ApplicationRecord
  validates_presence_of :id, :title, :content
end
