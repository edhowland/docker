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
  end
end
