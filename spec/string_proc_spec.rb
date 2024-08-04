# frozen_string_literal: true

require File.join(File.dirname(__FILE__), 'spec_helper')

describe String do
  describe 'Class configuration' do
    it 'adds a `proc_separator` to `String` defaulted to "."' do
      expect(described_class.proc_separator).to eq '.'
    end

    it 'can change the proc_separator' do
      expect { described_class.proc_separator = '/' }.to change(described_class, :proc_separator).from('.').to('/')
    end
  end

  describe '#to_proc' do
    before { described_class.proc_separator = '.' } # `proc_separator` is changed in tests

    it 'returns a proc' do
      expect(''.to_proc).to be_a(Proc)
    end

    it 'returns the result of chaining the methods on an object' do
      expect('to_i.zero?'.to_proc.call('5')).to be false
    end

    it 'is intended for `&` shorthand to explore objects' do
      expect(%i[one two].map(&'to_s.capitalize')).to eq %w[One Two]
    end

    it 'uses the overwritted `proc_separator` as expected' do
      described_class.proc_separator = '::'

      expect(%w[5 10].map(&'to_i::even?')).to eq [false, true]
    end
  end
end
