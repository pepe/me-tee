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

Given /^I designed a tee$/ do
  Given "I visit '/'"
  And "I follow 'hobby swim'"
  And "I follow 'face angry'"
  And "I follow 'job cook'"
  And "I follow 'male'"
  And "I select 'XXL' from 'size'"
end

