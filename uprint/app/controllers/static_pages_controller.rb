class StaticPagesController < ApplicationController
  def landing
  	render :layout => false
  end
  def test
  end
end
