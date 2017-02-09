class CatRentalRequestsController < ApplicationController
  def new
    # fail
    @request = CatRentalRequest.new(cat_id: params[:cat_id])
  end

  def create
    @request = CatRentalRequest.new(request_params)

    if @request.save
      redirect_to cat_url(@request.cat_id)
    else
      render :new
    end
  end

  def edit
    @request = CatRentalRequest.find(params[:id])
  end

  def update
    @request = CatRentalRequest.find(params[:id])

    if @request.save
      redirect_to cat_url(@request.cat_id)
    else
      render :edit
    end
  end

  def destroy
    @request = CatRentalRequest.find(params[:id])
    @request.destroy
    redirect_to cat_url(@request.cat_id)
  end

  def approve
    @request = CatRentalRequest.find(params[:id])
    @request.approve!

    redirect_to cat_url(@request.cat_id)
  end

  def deny
    @request = CatRentalRequest.find(params[:id])
    @request.deny!

    redirect_to cat_url(@request.cat_id)
  end

  private

  def request_params
    params.require(:request).permit(:cat_id, :start_date, :end_date, :status)
  end

end
