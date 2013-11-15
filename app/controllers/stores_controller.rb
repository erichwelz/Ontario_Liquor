require 'open-uri'
class StoresController < ApplicationController
  
  # def index
  #   stores_json = open("http://lcboapi.com/stores?per_page=50").read
  #   @stores = JSON.parse(stores_json)['result']
  # end

  def index
    counter = 1
    @stores = []
    until counter == 18 do
      stores_json = open("http://lcboapi.com/stores?per_page=50&page=#{counter}").read
      JSON.parse(stores_json)['result'].each do |store|
        @stores << store
      end
      counter += 1
    end
    @stores

  end


  def show
    store_json = open("http://lcboapi.com/stores/#{params[:id]}").read
    @store = JSON.parse(store_json)
  end

end
