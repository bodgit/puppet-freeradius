require 'spec_helper'

describe 'freeradius::user', :type => :define do

  let :facts do
    {
      :osfamily       => 'RedHat',
      :concat_basedir => '/var/lib/puppet/concat'
    }
  end

  let :pre_condition do
    'class { "::freeradius": }'
  end

  let :title do 'testuser' end

  context 'with defaults' do
    let :params do
      {
        :check_items => [
          'foo := "1"',
          'bar := "2"'
        ],
        :reply_items => [
          'baz := "3"',
          'quux := "4"'
        ]
      }
    end

    it do
      should contain_freeradius__user('testuser')
      should contain_concat__fragment('freeradius-user-testuser').with_content('bob')
    end
  end
end
