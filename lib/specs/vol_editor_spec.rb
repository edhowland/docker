# vol_editor_spec.rb - spec for VolEditor

require 'minitest/autorun'
require '../../bin/vol_editor'
require './std_file_mock'
describe VolEditorWorker do
  before do
    @in = StdinMock.new 'q'
    @out = StdoutMock.new
    @v = VolEditorWorker.new @in, @out, {}
  end

  it 'should return after (q)uit' do
    @v.repl
    @in.worked?.must_equal true
  end
end


