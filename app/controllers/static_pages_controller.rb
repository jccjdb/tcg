class StaticPagesController < ApplicationController

  def index
      @pikachu = get_pokemon('pikachu')
      @abilities = @pikachu.abilities
      @image = @pikachu.sprites.front_default
    end

    def get_pokemon(pokemon)
      PokeApi.get(pokemon: pokemon)
    end 
end
