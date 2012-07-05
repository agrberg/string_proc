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
      mock_obj = mock(Object)
      mock_obj.should_receive(:some_method)
      'some_method'.to_proc.call(mock_obj)
    end

    it 'should return the results of all the procs' do
      proc = 'to_i.zero?'.to_proc
      proc.call('5').should ==(false)
    end

    it 'should be usable in a map as an & proc to see the objects' do
      mock_1 = mock(:method => '5')
      mock_2 = mock(:method => '1')
      [mock_1, mock_2].map(&'method.to_f').should ==([5.0, 1.0])
    end
  end
end