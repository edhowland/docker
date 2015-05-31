# container_factory_spec.rb - ContainerFactory

require 'minitest/autorun'
require '../container'
CONFIG_ROOT = '.'
describe ContainerFactory do
  before do
    config = Config.new
    config.registry = 'swinehart'
    config.container_name = 'piper.pdftk'
    config.image_name = 'pdftk'
    config.tag = 'v0.1'
    config.arg = 'run.sh'
    config.save CONFIG_ROOT + '/pdftk.yml'
    @c = ContainerFactory.load CONFIG_ROOT, 'pdftk'
  end

  after do
    File.unlink './pdftk.yml'
  end

  it 'should be : sudo docker start piper.pdftk' do
    @c.start.must_equal 'sudo docker start piper.pdftk'
  end

  # rubocop:disable Metrics/LineLength
  it "should create be : sudo docker create --name='piper.pdftk' swinehart/pdftk:v0.1 run.sh" do
    @c.create.must_equal "sudo docker create --name='piper.pdftk' swinehart/pdftk:v0.1 run.sh"
  end
  # rubocop:enable Metrics/LineLength

  it 'should rm be : sudo docker rm piper.pdftk' do
    @c.rm.must_equal 'sudo docker rm piper.pdftk'
  end

  it 'should wait be : sudo docker wait' do
    @c.wait.must_equal 'sudo docker wait'
  end

  # rubocop:disable Metrics/LineLength
  it 'should start_then)wait be : sha=$(sudo docker start piper.pdftk); sudo docker wait ${sha}' do
    @c.start_then_wait.must_equal 'sha=$(sudo docker start piper.pdftk); sudo docker wait ${sha}'
  end
  # rubocop:enable Metrics/LineLength
end
