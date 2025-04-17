module SharedExamples
  shared_examples_for 'invalid_password' do
    it 'raises InvalidExistingPassword for passwords not 8 characters long' do
      expect { subject }.to raise_error(Day11::PasswordGenerator::InvalidExistingPassword)
    end
  end

  shared_examples_for 'invalid_instructions' do
    it 'raises InvalidInstructionError' do
      expect { subject }.to raise_error(Day1::FloorCalculator::InvalidInstructionError)
    end
  end
end