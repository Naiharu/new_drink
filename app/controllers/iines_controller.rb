class IinesController < ApplicationController

  before_action :set_item, only: [:create, :destroy]

  def create
    @iine = Iine.create(user_id: current_user.id, item_id: params[:item_id])
  end

  def destroy
    iine = Iine.find_by(user_id: current_user.id, item_id: params[:item_id])
    iine.destroy
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end
  end