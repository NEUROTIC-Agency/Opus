class RecruitersController < ApplicationController
  def index
    @recruiters = Recruiter.all
  end

  def show
  end
end
