require 'Open3'

Given(/^I aws account$/) do
  output, error, status = Open3.capture3 " ls inventory"
  expect(output).to include("ec2.py")
  expect(output).to include("ec2.ini")
end

Given(/^I configure it well$/) do
  output, error, status = Open3.capture3 "python inventory/ec2.py --list"
  expect(status.success?).to eq(true)
end

When(/^I Create ami$/) do
  cmd " ansible -v playbook.yml --tags \" find-ami, find-bucket, launch-instance, create\" "
  output, error, @status = Open3.capture3 "#{cmd}"
end

Then(/^It should be successful$/) do
  expect(@status.success?).to eq(true)
end

Then(/^Ami should exist$/) do
  cmd
  pending # Write code here that turns the phrase above into concrete actions
end