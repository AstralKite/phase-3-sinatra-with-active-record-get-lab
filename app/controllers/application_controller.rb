class ApplicationController < Sinatra::Base

#make the json legible 
set:default_content_type, 'application/json'

  # add routes
  get '/bakeries' do
    Bakery.all.to_json
  end

  get '/bakeries/:id' do
    id = params[:id]
    Bakery.find(id).to_json(include: :baked_goods)
  end

  get '/baked_goods/by_price' do
    # see the BakedGood class for the  method definition of `.by_price`
    baked_goods = BakedGood.all.order(price: :desc)
    baked_goods.to_json
  end

  get '/baked_goods/most_expensive' do
    BakedGood.all.order(price: :desc).first.to_json
  end
  
end
