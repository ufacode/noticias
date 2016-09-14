# frozen_string_literal: true
class Flows::NewslettersController < ApplicationController
  def index
    @newsletters = current_user.newsletters.order(id: :asc)
  end

  def show
    @newsletter = newsletter
    # render "flows/#{params[:id]}"
  end

  def new
    @newsletter = current_user.newsletters.build
  end

  def create
    @newsletter = current_user.newsletters.build(newsletter_params)
    if @newsletter.save
      redirect_to flows_newsletters_path, notice: 'Newsletter has been created'
    else
      render :new
    end
  end

  def update
    @newsletter = newsletter
    if @newsletter.update(newsletter_params)
      redirect_to flows_newsletter_path(@newsletter), notice: 'Изменения сохранены'
    else
      render :show
    end
  end

  def destroy
    newsletter_name = newsletter.name
    newsletter.destroy
    redirect_to flows_newsletters_path,
                notice: "Newsletter \"#{newsletter_name}\" has been deleted"
  end

  private

  def newsletter
    @_newsletter ||= current_user.newsletters.find(params[:id])
  end

  def newsletter_params
    params.require(:newsletter).permit(:name, :description, :link)
  end
end
