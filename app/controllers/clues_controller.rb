class CluesController < ApplicationController
  def show
    @clue = CluePresenter.new(clue)
  end

  private

  def clue
    ClueFinder.find(params[:location])
  end
end
