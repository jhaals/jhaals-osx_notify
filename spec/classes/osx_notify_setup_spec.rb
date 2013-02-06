require 'spec_helper'

describe 'osx_notify::setup' do
  it do
    should contain_package('terminal-notifier').with({
      'ensure'   => 'latest',
      'provider' => 'gem',
    })
  end
end
