require_relative '../../day1/santa_floor_calculator'
require_relative '../shared_examples'

RSpec.describe Day1::SantaFloorCalculator do
  include SharedExamples

  let(:subject) { Day1::SantaFloorCalculator.call(instructions) }

  describe '.call' do
    context 'when invalid instructions are passed in' do
      let(:instructions) { '( )'}

      it_behaves_like 'invalid_instructions'
    end

    context "when instructions result in floor 0" do
      let(:instructions) { ')(()' }

      it "returns 0 for (())" do
        expect(subject).to eq(0)
      end
    end

    context "when an empty instruction is passed in" do
      let(:instructions) { '' }

      it "returns 0" do
        expect(subject).to be_zero
      end
    end

    context 'when a nil instruction are passed in' do
      let(:instructions) { nil }

      it 'returns 0' do
        expect(subject).to be_zero
      end
    end

    context "when instructions result in floor 3" do
      let(:instructions) { '(()(()(' }

      it "returns 3 for '(()(()('" do
        expect(subject).to eq(3)
      end
    end

    context "when instructions result in floor -1" do
      let(:instructions) { '))(' }

      it "returns -1 for '))('" do
        expect(subject).to eq(-1)
      end
    end
  end
end
