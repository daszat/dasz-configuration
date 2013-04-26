require "#{File.join(File.dirname(__FILE__),'..','spec_helper.rb')}"

describe 'dasz::defaults' do

  let(:title) { 'dasz::defaults' }
  let(:node) { 'rspec.example.org' }
  let(:facts) { { :ipaddress => '10.42.42.42' } }

  describe 'Test standard installation' do
    it { should contain_package('puppet').with_ensure('present') }
  end

end

