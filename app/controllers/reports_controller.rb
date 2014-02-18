class ReportsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :authorized_to_view_report?, only: [:show]
  def index
    @reports = Report.all
  end

  def show
    @report = Report.find(params[:id])
  end

  private
  def authorized_to_view_report?
    authorize! :read, "report_#{params[:id]}".to_sym
  end
end