require 'test_helper'
require 'rails/generators'
require 'generators/pagers/install_generator'

class GeneratorsTest < Rails::Generators::TestCase
  destination Rails.root.join('tmp')

  teardown do
    FileUtils.rm_rf destination_root
  end

  test 'install' do
    self.class.tests Pagers::InstallGenerator
    run_generator
    assert_file 'config/initializers/pagers.rb'
  end

end
