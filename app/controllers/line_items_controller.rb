# frozen_string_literal: true

# Line Item is individual items inside a cart.
class LineItemsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: %i[create decrement]
  before_action :set_line_item, only: %i[show edit update destroy]

  # GET /line_items or /line_items.json
  def index
    @line_items = LineItem.all
  end

  # GET /line_items/1 or /line_items/1.json
  def show; end

  # GET /line_items/new
  def new
    @line_item = LineItem.new
  end

  # GET /line_items/1/edit
  def edit; end

  # POST /line_items or /line_items.json
  def create
    product = Product.find(params[:product_id])
    @line_item = @cart.add_product(product)

    respond_to do |format|
      if @line_item.save
        format.turbo_stream { @current_item = @line_item}
        format.html { redirect_to store_index_url, notice: 'Item was added to cart.' }
        format.json { render :show, status: :created, location: @line_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /line_items/1 or /line_items/1.json
  def update
    respond_to do |format|
      if @line_item.update(line_item_params)
        format.html { redirect_to @line_item, notice: 'Line item was successfully updated.' }
        format.json { render :show, status: :ok, location: @line_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_items/1 or /line_items/1.json
  def destroy
    @line_item.destroy

    respond_to do |format|
      # format.turbo_stream
      format.html do
        redirect_to store_index_url,
                    status: :see_other,
                    notice: 'Item was successfully removed from the cart.'
      end
      format.json { head :no_content }
    end
  end

  def decrement
    line_item = LineItem.find(params[:id])
    line_item.quantity -= 1

    @current_item = line_item

    if line_item.quantity.positive? && line_item.save
      respond_to do |format|
        format.turbo_stream
        format.html do
          redirect_to store_index_url, notice: 'Item was decremented.'
        end
      end
    elsif line_item.quantity.zero? && line_item.destroy
      respond_to do |format|
        format.turbo_stream
        format.html do
          redirect_to store_index_url, notice: 'Item was deleted from your cart'
        end
      end
    else
      redirect_to store_index_url, notice: 'Item could not be decremented.'
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_line_item
    @line_item = LineItem.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def line_item_params
    params.require(:line_item).permit(:product_id)
  end
end
