class Store < ActiveRecord::Base
  belongs_to :cities,  :foreign_key => "city_id"
  has_many :stores_salsas
  has_many :stores_tacos
end