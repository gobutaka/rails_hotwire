class PokemonsController < ApplicationController
  before_action :set_pokemon, only: %i[ show edit update destroy ]

  def index
    @search = Pokemon.ransack(params[:q])
    @pokemons = @search.result.page(params[:page])
  end

  def show
  end

  def new
    @pokemon = Pokemon.new
  end

  def edit
  end

  def create
    @pokemon = Pokemon.new(pokemon_params)

    if @pokemon.save
      flash.now.notice = "ポケモンを登録しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @pokemon.update(pokemon_params)
      flash.now.notice = "ポケモンを更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @pokemon.destroy
    flash.now.notice = "ポケモンを削除しました"
  end

  private

    def set_pokemon
      @pokemon = Pokemon.find(params[:id])
    end

    def pokemon_params
      params.require(:pokemon).permit(:name, :pokedex_number, :total_base_stats)
    end
end
