# container_factory_spec.rb - ContainerFactory

require 'minitest/autorun' 
require '../container'
CONFIG_ROOT='.'
describe ContainerFactory do
  before do
    config = Config.new
    config.container_name = 'piper.pdftk'
    config.registry = 'swineheart'
    config.image_name = 'pdftk'
    config.tag = 'v0.1'
    config.arg = 'run.sh'
    config.save  CONFIG_ROOT + '/pdftk.yml'
    @c = ContainerFactory.load CONFIG_ROOT, 'pdftk'
  end

  it "should create be : sudo docker create --name='piper.pdftk' swineheart/pdftk:v0.1 run.sh" do
    @c.create.must_equal "sudo docker create --name='piper.pdftk' swineheart/pdftk:v0.1 run.sh"
  end

  it 'should start be : sudo docker start piper.pdftk' do
    @c.start.must_equal 'sudo docker start piper.pdftk'
  end
end
