class Api::V1::ItemsController < ApplicationController
	before_action :load_item, only: %i[update destroy]
	skip_before_action :authenticate_request, only: %i[index]

	def index
		items = Item.all
		render json: items, status: 200
	end

	def create
		@item = Item.new item_params

		if @item.save
			render json: { status: true, data: @item }, status: :created
		else
			render json: { status: false, error: @item.errors }, status: :unprocessable_entity
		end
	end

	def update
		if @item.update item_params
			render json: { status: true, data: @item }, status: :created
		else
			render json: { status: false, error: @item.errors }, status: :unprocessable_entity
		end
	end

	def destroy
		@item.destroy
		render json: { status: true, data: @item }, status: :ok
	end

	private

	def item_params
		params.require(:item).permit(:title, :price, :shipping_cost, :bids, :end_at, :image)
	end

	def load_item
		@item = Item.find_by id: params[:id]
		return if @item
		render json: { status: false, message: 'Not found' }, status: :not_found
	end
end
