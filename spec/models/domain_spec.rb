require 'rails_helper'

RSpec.describe Domain, type: :model do
  context "associations" do
    it { have_many :urls }
  end
  
  context "validations" do
    it { validate_presence_of :domain }
  end
end
