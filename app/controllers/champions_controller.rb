class ChampionsController < ApplicationController
  protect_from_forgery with: :null_session
 def index
    @champions = Champion.all
    render xml: @champions.to_xml
  end

  def show
    @champion = find_champion
    render xml: @champion.to_xml
  end

def create
  @champion = Champion.new(champion_params)
  if @champion.save
    render xml: @champion.as_json, status: :created
  else
    render xml: @champion.errors, status: :unprocessable_entity
  end
end

  def update
    @champion = find_champion
    if @champion.update(champion_params)
      render xml: @champion.as_json
    else
      render xml: @champion.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @champion = find_champion
    @champion.destroy
    head :no_content
  end

  private

  def find_champion
    Champion.find(params[:id])
  end


  def champion_params
    params.require(:champion).permit(:name, :role, :difficulty, :price)
  end
end
