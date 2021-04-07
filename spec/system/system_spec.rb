describe "usage of the app" do
  
  it "creates a tiny url" do
    visit '/'
    within("#new_url") do
      fill_in "url_full_url", with: "www.google.com"      
    end
    click_button "Shorten Url"
    expect(page).to have_content "Copy"
  end

  it "return to root when invalid url" do
    visit '/'
    within("#new_url") do
      fill_in "url_full_url", with: "a"  
    end
    click_button "Shorten Url"
    expect(page).to have_content "Invalid Url"
  end
end
