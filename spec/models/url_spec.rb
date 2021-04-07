require 'rails_helper'

RSpec.describe Url, type: :model do
  context "associations" do
    it { belong_to :domain }
  end
  
  context "validations" do
    it { validate_presence_of :full_url }
    it { should allow_value("www.google.com").for(:full_url) }
    it { should allow_value("www.duckduckgo.com").for(:full_url) }
    it { should allow_value("www.youtube.com").for(:full_url) }

    it { should_not allow_value("Inv4lid_").for(:full_url) }
    it { should_not allow_value("a").for(:full_url) }
    it { should_not allow_value("0982").for(:full_url) }
  end
  
end
