require 'spec_helper'

describe 'freeradius' do

  context 'on unsupported distributions' do
    let(:facts) do
      {
        :osfamily => 'Unsupported',
      }
    end

    it do
      expect { subject }.to raise_error(/not supported on an Unsupported/)
    end
  end

  context 'on RedHat' do
    let(:facts) do
      {
        :osfamily       => 'RedHat',
        :concat_basedir => '/var/lib/puppet/concat'
      }
    end

    context 'version 7', :compile do
      let(:facts) do
        super().merge(
          {
            :operatingsystemmajrelease => 7
          }
        )
      end

      it do
      end
    end
  end
end
