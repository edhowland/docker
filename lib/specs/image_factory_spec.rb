# image_factory_spec.rb - specs for ImageFactory

require 'minitest/autorun'
require '../image'

describe ImageFactory do
  before do
    @c = Config.new
    @c.image_name = 'pdftk'
    @c.container_name = 'piper.pdftk'
    @c.registry = 'swinehart'
    @c.tag = 'v0.1'
    @c.save('pdftk.yml')
    @i = ImageFactory.load(File.dirname(__FILE__), 'pdftk')
  end

  after do
    File.unlink 'pdftk.yml'
  end
  it 'should build be : sudo docker build -t "swinehart/pdftk:v0.1" .' do
    @i.build.must_equal 'sudo docker build -t "swinehart/pdftk:v0.1" .'
  end
end
