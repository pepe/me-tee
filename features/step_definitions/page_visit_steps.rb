Given /^I visit '(.+)'$/ do |url|
  visit(url)
end

Then /^I should see '(.+)'$/ do |text|
  page.should have_content(text)
end

Then /^I should not see '(.+)'$/ do |text|
  response_body.should_not contain(Regexp.new(text, Regexp::MULTILINE))
end

Then /^I should see big '(^'.+)'$/ do |text|
  text = '<h1>[\s]*%s[\s]*<\/h1>' % text
  response_body.should =~ Regexp.new(text)
end

Then /^I fill in '(.*)' for '(.*)'$/ do |value, field|
  fill_in(field, :with => value)
end

When /^I press '(.*)'$/ do |name|
  click_button(name)
end

Then /^I could press '(.*)'$/ do |name|
  Then "I press '#{name}'"
end

Then /^I choose '(.*)'$/ do |value|
  choose(value.gsub(/ /, '')) 
end

Given /^I will get mail$/ do
  Pony.should_receive(:mail)
end

Then /^I follow '(.+)'$/ do |link|
  click_link link
end

Then /^I could follow '(.+)'$/ do |link|
  Then "I follow '#{link}'"
end

When /^I select '(.+)' from '(.+)'$/ do |value, field|
  select(value, :from => field) 
end

Then /^I could select '(.+)' from '(.+)'$/ do |value, field|
  When "I select '#{value}' from '#{field}'"
end

Then /^I should see '([^']+)' icon '([^']+)'$/ do |type, name|
  response_body.should have_selector('img', :src => "/icons/#{type}/#{name}.gif")
end

Then /^I should see not '([^']+)' icon '([^']+)'$/ do |type, name|
  response_body.should_not have_selector('img', :src => "/icons/#{type}/#{name}.gif")
end

Then /^I should see choosed icon '([^']+)' in '([^']+)'$/ do |name, type|
  response_body.should have_selector('div', :class => 'placeholder', :id => "#{type}-placeholder") do |node|
    node.first.inner_html.should =~ /#{name}/
  end
end

Then /^I should see '([^']+)' placeholder$/ do |type|
 response_body.should have_selector('div', :class => 'placeholder', :id => "#{type}-placeholder") 
end

Given /^I choose size '([^']+)'$/ do |size|
  visit '/' + size
end

Then /^I should see choosed '([^']+)'$/ do |size|
  response_body.should have_selector('option', :selected => 'selected', :content => size)
end

Given /^I know customer '([^']+)' ordered tee as usual$/ do |customer|
  Given "I ordered tee as usual as customer '#{customer}'"
end

Given /^I ordered tee as usual as customer '([^']+)'$/ do |customer|
  Given "I designed a tee"
  And "I press 'objednat'"
  Given "I fill in '#{customer}' for 'name'"
  And "I fill in 'Pool 1' for 'street'"
  And "I fill in 'Prague' for 'city'"
  And "I fill in '11150' for 'zip'"
  And "I fill in 'joe@doe.cz' for 'email'"
  And "I fill in '420777888999' for 'phone'"
  And "I fill in 'will come again' for 'note'"
  And "I fill in 'METEE2010' for 'coupon'"
  Then "I press 'Pokračovat v objednávce'"
  When "I follow 'DOKONČIT OBJEDNÁVKU'"
end

Then /^I should see '([^']+)' prefilled in '([^']+)'$/ do |content, id|
  response_body.should have_selector('input', :id => id, :value => content)
end

Given /^I left session$/ do
  last_request.session[:order] = nil
end

Then /^mail should be sent to my address '(.+)'$/ do |email|
  Mail.deliveries.size.should == 1
  Mail.deliveries.first.to.value == /#{email}/
end

Given /^I am using ajax$/ do
  header 'X-Requested-With', 'XMLHttpRequest'
end

Given /^I designed a tee$/ do
  Given "I visit '/'"
  And "I visit '/faces/angry'"
  And "I visit '/hobbies/swim'"
  And "I visit '/jobs/cook'"
  And "I visit '/male'"
end

Then /^I should see startup link$/ do
  response_body.should have_selector('a', :id => "startup") 
end

Then /^I should not see startup link$/ do
  response_body.should_not have_selector('a', :id => "startup") 
end


