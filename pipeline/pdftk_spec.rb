# pdftk_spec.rb - specs to check for pdftk working

require 'minitest/autorun'
require 'rake'

describe 'pdftk' do
  before do
    @app = Rake.application
    @app.init
    @app.load_rakefile
    @app['pdftk'].invoke
  end

  after do
    @app['clean'].invoke
    File.unlink './output/log.txt'
  end

  it 'should have created output/log.txt' do
    File.exists?('./output/log.txt').must_equal true
  end
end
