class Api::PokemonController < ApplicationController

  def create
    @pokemon = Pokemon.new(pokemon_params)
    if @pokemon.save
      render :show
    else
      render json: @pokemon.errors.full_messages
    end
  end

  def index
    @pokemon = Pokemon.all
  end

  def show
    @pokemon = Pokemon.find(params[:id])
  end

  private

  def pokemon_params
    params.require(:pokemon).permit(
      :name,
      :attack,
      :defense,
      :poke_type,
      :image_url,
      moves:[]
    )
  end
end
