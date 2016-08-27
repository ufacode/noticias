# frozen_string_literal: true
class FlowsController < ApplicationController
  def index; end

  def show
    render "flows/#{params[:id]}"
  end
end
