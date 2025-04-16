# frozen_string_literal: true

require_relative '../../day11/password_generator'
require_relative '../shared_examples'

RSpec.describe Day11::PasswordGenerator do
  include SharedExamples

  subject { described_class.new(password).call }

  describe '#call' do

    context 'when the initial password is invalid' do
      context 'when password is less than 8 characters' do
        let(:password) { 'short' }

        it_behaves_like 'invalid_password'
      end

      context 'when password is greater than 8 characters' do
        let(:password) { 'longlonglong' }

        it_behaves_like 'invalid_password'
      end

      context 'when password contains an invalid character i' do
        let(:password) { 'abcddeei' }

        it_behaves_like 'invalid_password'
      end

      context 'when password contains an invalid character o' do
        let(:password) { 'abcddeeo' }

        it_behaves_like 'invalid_password'
      end

      context 'when password contains an invalid character l' do
        let(:password) { 'abcddeeo' }

        it_behaves_like 'invalid_password'
      end

      context 'when password contains non lowercase alphabet' do
        let(:password) { 'abc deeo' }

        it_behaves_like 'invalid_password'
      end
    end
  end

  context 'when generating the next valid password' do
    let(:password) { 'abcdffbh' }

    # h will first go all the way to z
    # z will then change to a, on the same iteration b will be changed to c
    # increment_pass is called again and
    # we again start from the last index till a becomes c
    it 'finds the next valid password for abcdffbh' do
      expect(subject).to eq('abcdffcc')
    end
  end

  context 'when we expect invalid characters to be introduced in the new password' do
    let(:password) { 'abcddeeh' }

    it 'correctly skips forbidden characters like "i", "o", "l" during increment' do
      # without forbidden character check we would have abcddeei
      expect(subject).to eq('abcddeej')
    end
  end
end


