Given /^there are icons in system$/ do
  Icon.destroy_all
  Icon.create(:type => 'hobby', :name => 'swim', :filename => 'swim.gif')
  Icon.create(:type => 'face', :name => 'angry', :filename => 'angry.gif')
  Icon.create(:type => 'job', :name => 'cook', :filename => 'cook.gif')
end

Then /^I should see big '(.+)' icon for '(.+)'$/ do |icon, type|
  page.should have_css "##{type.pluralize}-placeholder img[@src='/icons/#{icon}.gif']"
end

Given /^I saved design before$/ do
  @design = Design.create(:hobby => 'hobby-swim',
                       :face => 'face-angry',
                       :job => 'job-cook')
end

Given /^I visit saved design page$/ do
  Given "I visit '/design/%s'" % @design.id
end

