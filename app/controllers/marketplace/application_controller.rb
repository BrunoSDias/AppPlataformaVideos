class Marketplace::ApplicationController < ApplicationController
  skip_before_action :authorize
end
