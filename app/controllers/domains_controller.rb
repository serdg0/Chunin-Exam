class DomainsController < ApplicationController
  before_action :get_top_queries, only: [:new, :show]

  def new
    @domain = Domain.new
  end

  def create
    domain = Domain.new(domain_params)

    if domain.valid?
      domain.save!
      redirect_to domain
    else
      redirect_to root_path, alert: "Invalid Url"
    end
  end

  def show
    domain = Domain.find(params[:id])
    @short = request.base_url + "/" + domain.short_subdomain
  end

  def redirect
    domain = Domain.find_by(short_subdomain: params[:short_subdomain])
    redirect_to domain.url
  end

  private

  def get_top_queries
    @top_queries = Domain.top_queries
  end

  def domain_params
    params.require(:domain).permit(:url)
  end
end
