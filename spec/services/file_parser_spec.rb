require 'rails_helper'

RSpec.describe FileParser do
  describe '#parse' do
    let(:file_path) { 'spec/fixtures/test_file.txt' }

    before do
      # Prepare a sample test file in the fixture directory
      File.open(file_path, 'w') do |file|
        file.puts "2201903010000000500232702980567677****8778141808JOSÉ COSTA    MERCEARIA 3 IRMÃOS\n"
        file.puts "3201903010000019200845152540736777****1313172712MARCOS PEREIRAMERCADO DA AVENIDA\n"
      end
    end

    after do
      # Clean up the test file after the test runs
      File.delete(file_path) if File.exist?(file_path)
    end

    it 'parses the file and creates payment transactions' do
      # Stub PaymentMethod.find_by to return a mock PaymentMethod
      allow(PaymentMethod).to receive(:find_by).and_return(PaymentMethod.new(id: 2))  # Example stub for payment_type 2

      expect(PaymentTransaction).to receive(:create!).twice

      FileParser.new(file_path).parse
    end

    it 'handles non-existent payment methods gracefully' do
      # Stub PaymentMethod.find_by to return nil
      allow(PaymentMethod).to receive(:find_by).and_return(nil)  # Simulate non-existent payment_method

      expect {
        FileParser.new(file_path).parse
      }.to output(/Payment method with ID \d+ not found/).to_stdout
      # Adjust the regex and message to match your logging or error handling mechanism
    end
  end
end