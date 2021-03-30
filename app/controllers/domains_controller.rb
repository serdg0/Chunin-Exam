class DomainsController < ApplicationController
  
  def index
  end

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
    @short = domain.short_subdomain
  end

  def redirect
    domain = Domain.find_by(short_subdomain: params[:short_subdomain])
    redirect_to domain.url
  end

  private

  def domain_params
    params.require(:domain).permit(:url)
  end
end
