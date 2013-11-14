require 'open-uri'
class StoresController < ApplicationController
  def index
    stores_json = open("http://lcboapi.com/stores?per_page=50").read
    @stores = JSON.parse(stores_json)
  end

  def show
    store_json = open("http://lcboapi.com/stores/#{params[:id]}").read
    @store = JSON.parse(store_json)
  end

end
