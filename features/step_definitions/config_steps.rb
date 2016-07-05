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
  cmd = "ansible-playbook playbook.yml  --tags 'find-bucket,find-ami,launch-instance,create-image, compile'"
  output, error, @status = Open3.capture3 "#{cmd}"
end

Then(/^It should be successful$/) do
 expect(@status.success?).to eq(true)
end

Then(/^Ami should exist$/) do
  cmd = "ansible-playbook playbook.yml  --tags find-bucket"
  output, error, status = Open3.capture3 "#{cmd}"
  expect(status.success?).to eq(true)
end


When(/^I Launch CloudFormation$/) do
  cmd = "ansible-playbook playbook.yml --tags cloudformation"
  output, error, @status = Open3.capture3 "#{cmd}"
end

When(/^I Upload the wesbsite$/) do
  cmd = "ansible-playbook playbook.yml --tags site-upload"
  output, error, @status = Open3.capture3 "#{cmd}"
end