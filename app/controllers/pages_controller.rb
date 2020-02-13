class PagesController < ApplicationController
  def team
  end
  def contact
  end
  def city
    @gossips = []
    @city = City.find(params[:id])
    Gossip.all.each do |gossip|
      if gossip.user.city == @city
        @gossips << gossip
      end
    end
  end
end
