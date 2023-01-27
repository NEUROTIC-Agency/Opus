class CandidatesController < ApplicationController
  def index
    @candidates = Candidate.all
  end

  def show
  end
end
