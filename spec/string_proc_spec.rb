require File.join(File.dirname(__FILE__), 'spec_helper')

describe String do
  describe 'Class' do
    it 'has a class variable called @@proc_separator' do
      expect(String.class_variables).to include(:@@proc_separator)
    end

    it 'is "." by default' do
      expect(String.class_variable_get(:@@proc_separator)).to eq '.'
    end

    it 'can change the proc_separator' do
      String.proc_separator = '/'

      expect(String.class_variable_get(:@@proc_separator)).to eq '/'
    end
  end

  describe '#to_proc' do
    before(:all) { String.proc_separator = '.' }

    it 'returns a proc when called on a string' do
      expect(''.to_proc).to be_a(Proc)
    end

    it 'turns all method names in the string to procs' do
      double_obj = spy(Object)
      'some_method'.to_proc.call(double_obj)

      expect(double_obj).to have_received(:some_method)
    end

    it 'returns the results of calling all the procs in order on their results' do
      proc = 'to_i.zero?'.to_proc

      expect(proc.call('5')).to eq false
    end

    it 'is usable in a map as an `&`` proc to see the objects' do
      double_1 = double(method: '5')
      double_2 = double(method: '1')

      expect([double_1, double_2].map(&'method.to_f')).to eq [5.0, 1.0]
    end

    it 'functions the same when the `proc_separator` is not the default' do
      String.proc_separator = '::'
      double_obj = double(method: '5')

      expect('method::to_f'.to_proc.call(double_obj)).to eq 5.0
    end
  end
end
