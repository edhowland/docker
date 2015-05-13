# container_factory_spec.rb - ContainerFactory

require 'minitest/autorun' 
require '../container'
CONFIG_ROOT='.'
describe ContainerFactory do
  before do
    @c = ContainerFactory.load CONFIG_ROOT, 'pdftk'
  end

  it 'should be :' do
  @c.start.must_equal ''
  end
end
