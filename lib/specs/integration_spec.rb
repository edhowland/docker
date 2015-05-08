#integration_spc.rb - tests full composable container verbs

require 'minitest/autorun'
require '../container'


describe 'Integrating full command line' do
  before do
    @c = Sudo.new + Docker.new + Container.new('image', 'name', 'command', '/d1' => '/v1')
  end
  it 'should be create : sudo docker create --name=\'name\' -v /d1:/v1 image command' do
    @c.create.must_equal "sudo docker create --name='name' -v /d1:/v1 image command"
  end

  it 'should have start be : sudo docker start name' do
    @c.start.must_equal 'sudo docker start name'
  end
end
