class RoundsController < ApplicationController
  before_filter :authorize, only: [:new, :create, :participate, :unparticipate]
end
