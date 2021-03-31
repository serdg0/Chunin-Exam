class UrlsController < ApplicationController
  before_action :get_top_queries, only: [:new, :show]

  def new
    @url = Url.new
  end

  def create
    url = Url.new(url_params)
    url.domain = add_visit_or_create_domain

    if url.valid?
      url.save!
      redirect_to url
    else
      redirect_to root_path, alert: "Invalid Url"
    end
  end

  def show
    url = Url.find(params[:id])
    @short = request.base_url + "/" + url.short_url
  end

  def redirect
    url = Url.find_by(short_url: params[:short_url])
    redirect_to url.full_url
  end

  private

  def get_top_queries
    @top_queries = Domain.top_ten_domains
  end

  def add_visit_or_create_domain
    domain = Domain.find_by(domain: extract_domain)
    if domain
      domain.update!(visits: domain.visits += 1)
      domain
    else
      create_domain(extract_domain)
    end
  end

  def extract_domain
    URI(url_params[:full_url]).host
  end

  def create_domain(domain)
    Domain.create!(domain: domain, visits: 1)
  end

  def url_params
    params.require(:url).permit(:full_url)
  end
end
