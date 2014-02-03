require File.join(File.dirname(__FILE__), 'spec_helper')

describe String do
  describe 'Class' do
    it 'should have a class variable called @@proc_separator' do
      String.class_variables.should include(:@@proc_separator)
    end

    it 'should be "." by default' do
      String.class_variable_get(:@@proc_separator).should == '.'
    end

    it 'should be able to change the proc_separator' do
      String.proc_separator = '/'
      String.class_variable_get(:@@proc_separator).should == '/'
    end
  end

  describe '#to_proc' do
    before(:all) do
      String.proc_separator = '.'
    end

    it 'should return a proc when called on a string' do
      ''.to_proc.should be_a(Proc)
    end

    it 'should turn all method names in the string to procs' do
      double_obj = double(Object)
      double_obj.should_receive(:some_method)
      'some_method'.to_proc.call(double_obj)
    end

    it 'should return the results of all the procs' do
      proc = 'to_i.zero?'.to_proc
      proc.call('5').should == false
    end

    it 'should be usable in a map as an & proc to see the objects' do
      double_1 = double(:method => '5')
      double_2 = double(:method => '1')
      [double_1, double_2].map(&'method.to_f').should == [5.0, 1.0]
    end

    it 'should function the same when the `proc_separator` is changed' do
      String.proc_separator = '::'
      double_obj = double(:method => '5')
      'method::to_f'.to_proc.call(double_obj).should == 5.0
    end
  end
end
