class DashboardController < ApplicationController
  before_action only: [:index] do
    redirect_to notfound_path unless authenticated?
  end

  def index
  end
end
