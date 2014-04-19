class WswController < ApplicationController
  include ApplicationHelper

  def index
    redirect_to new_user_session_url unless current_user.present?
  end

  def edit
  
    if params[:k].present? && params[:a].present?
      key = URI.decode(params[:k])
      if decrypt(key) == params[:a]
        @submission = Archive.find(params[:a])
      end
    elsif params[:silk_identifier].present?
      @submission = Archive.where(silk_identifier: URI.decode(params[:silk_identifier]), status: "submitted").first
    end
    render "edit" and return if @submission.present?
    not_allowed
  end

  def not_allowed
    render :json => { :error => "You are not allowed to do that" }, :status => 403 and return
  end

end