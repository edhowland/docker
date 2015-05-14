# vol_editor_spec.rb - spec for VolEditor

require 'minitest/autorun'
require '../../bin/vol_editor'
require './std_file_mock'
describe VolEditorWorker do
  describe 'quiting' do
    before do
      @in = StdinMock.new 'q'
      @out = StdoutMock.new
      @v = VolEditorWorker.new @in, @out, {}
      @v.repl
    end

    it 'should return after (q)uit' do
      @in.worked?.must_equal true
    end

  it 'should have printed something' do
      @out.worked?.must_equal true
    end

    it 'should have printed : (a)dd, (d)elete or (q)uit : ' do
      @out.string.must_match  /\(a\)dd, \(d\)elete or \(q\)uit : /
    end
  end

  describe 'printing msg for adding' do
  end
end


