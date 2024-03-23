class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]
  def index
    @lists = List.all
  end

  def show
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(set_list)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new
    end

    def edit

    end

    def update
      @list.update(set_list)
      redirect_to list_path(@list)
    end

    def destroy
      @list.destroy
      redirect_to lists_path, status: :see_other
    end
  end
  private

  def list_params
    params.require(:list).permit(:name)
  end

  def set_list
    @list = List.find(param[:id])
  end
end
