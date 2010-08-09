Given /^there are icons in system$/ do
  Icon.destroy_all
  Icon.create(:type => 'hobby', :label => 'swim', :filename => 'swim.gif')
  Icon.create(:type => 'face', :label => 'angry', :filename => 'angry.gif')
  Icon.create(:type => 'job', :label => 'cook', :filename => 'cook.gif')
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

Given /^I ordered tee as usual$/ do
  Given "I designed a tee"
  And "I press 'order'"
  And "I fill in 'Joe Doe' for 'fullname'"
  And "I fill in 'Pool 1' for 'street'"
  And "I fill in 'Prague' for 'city'"
  And "I fill in '11150' for 'zip'"
  And "I fill in 'joe@doe.cz' for 'email'"
  And "I fill in '420777888999' for 'phone'"
  And "I fill in 'will come again' for 'note'"
  And "I fill in 'METEE2010' for 'coupon'"
  And "I press 'order'"
  And "I follow 'CONFIRM ORDER'"
end

