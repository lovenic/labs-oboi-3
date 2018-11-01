# frozen_string_literal: true

require_relative '../vector_wrapper'

RSpec.describe VectorWrapper do
  context '#call' do
    context 'happy path' do
      let(:first_arg) { [2.0, 3.0, 4.0] }
      let(:second_arg) { [1.0, 2.0, 3.0] }
      let(:call) { described_class.new(first: first_arg, second: second_arg, operation: operation).call }

      context 'add' do
        let(:operation) { '+' }
        it 'adds vectors' do
          expect(call).to eq(Vector::elements([3, 5, 7]))
        end
      end

      context 'subtract' do
        let(:operation) { '-' }
        it 'substracts vectors' do
          expect(call).to eq(Vector::elements([1, 1, 1]))
        end
      end

      context 'multiply' do
        let(:second_arg) { 2 }
        let(:operation) { '*' }
        it 'adds multiplies' do
          expect(call).to eq(Vector::elements([4, 6, 8]))
        end
      end

      context 'divide' do
        let(:second_arg) { 2 }
        let(:operation) { '/' }
        it 'divides vectors' do
          expect(call).to eq(Vector::elements([1, 1.5, 2]))
        end
      end
    end
  end
end