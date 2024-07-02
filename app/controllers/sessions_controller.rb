# frozen_string_literal: true

class SessionsController < Devise::SessionsController
  include RackSessionsFix

  respond_to :json

end
