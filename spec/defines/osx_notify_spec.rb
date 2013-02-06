require 'spec_helper'

describe 'osx_notify' do
  context 'Running Mac OS X 10.8 or higher' do
    let(:facts) {
      {
        :macosx_productversion_major => '10.8',
        :users_online => 'jhaals'
      }
    }
    let(:title) { 'testing' }
    let(:params) {
      {
      :message => 'Hello World',
      :subject => 'testing',
      }
    }
    it do
      should include_class('osx_notify::setup')
      should contain_exec('osx_notify-testing').with({
        'command'     => "terminal-notifier -title \"testing\" -message \"Hello World\" -open false",
        'path'        => ['/usr/bin', '/bin'],
        'require'     => 'Package[terminal-notifier]',
        'user'        => 'jhaals',
        'refreshonly' => 'false',
        'schedule'    => 'false'
      })
    end
  end
  context 'Running anything else than OS X' do
    let(:title) { 'testing' }
    let(:params) {
      {
      :message => 'Hello World',
      :subject => 'testing',
      }
    }
    it do
      should contain_notify('testing')
    end
  end
end
