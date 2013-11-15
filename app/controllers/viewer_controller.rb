require 'open-uri'
class ViewerController < ApplicationController
require 'rubygems'
require 'json'

  # def index
  #   products_json = open('http://lcboapi.com/products?per_page=50').read
  #   @products = JSON.parse(products_json)
  # end

  def index
    counter = 1
    @products = []
    until counter == 240 do
      products_json = open("http://lcboapi.com/products?per_page=50&page=#{counter}").read
      JSON.parse(products_json)['result'].each do |product|
        @products << product
      end
      counter += 1
    end
    @products

  end

  def show
    product_json = open("http://lcboapi.com/products/#{params[:id]}").read
    @product = JSON.parse(product_json)
  end

end


