#encoding: utf-8
#!/usr/bin/env ruby

When(/^I request GET "(.*?)"$/) do |cep|
  @last_response = HTTParty.get('http://cep.correiocontrol.com.br' + cep)
end


Then /^the JSON response should include "([^\"]*)"$/ do |response|
  JSON.parse(@last_response.body).to_s.should match response
end

Then /^the JSON response code should be (\d+)$/ do |number|
  @last_response.code.should == number.to_i
end

Then /^the JSON key "([^\"]*)" should include "(.*?)"$/ do |key, value|
  puts JSON.parse(@last_response.body)[key].to_s.should match value
end

Then /^show final json$/ do
	puts @last_response.code.to_s
	puts @last_response.body.to_s
end

Then /^the response should include erro$/ do
	@last_response.body.to_s.should include 'erro'
end

#Then /^the JSON response should not include "([^\"]*)"$/ do |response|
#  JSON.parse(@last_response.body).to_s.should_not match response
#end