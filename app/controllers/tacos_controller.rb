class TacosController < ApplicationController
  def index
    @tacos = Taco.order(:name).all
    @salsas = Salsa.order(:name).all
    @cities = Cities.order(:name).all
  end

  def find_tacos
    tacos = params["taco_ids"]
    salsas = params["salsa_ids"]
    cities = params["city_ids"]

    if !tacos || !salsas || !cities
      redirect_to(action: 'index') and return
    end

    stores = Store.joins(:cities)
                 .where(cities: cities)
                 .joins(:stores_tacos)
                 .where(:stores_tacos => {:taco_id => tacos})
                 .joins(:stores_salsas)
                 .where(:stores_salsas => {:salsa_id => salsas})
                 .order(:name)
                 .distinct

    @stores_with_city = []
    stores.all.each do | store |
      @stores_with_city.push({store_name: store.name, city_name: store.cities.name,
                              sells_beer: store.sells_beer, zagat_rating: store.zagat_rating})
    end

  end
end
