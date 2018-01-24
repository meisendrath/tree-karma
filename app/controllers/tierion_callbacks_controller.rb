class TierionCallbacksController < ApplicationController
  def receipt_ready
    p 'start'
    p params
  end
end
