module Pagers
  class Railtie < Rails::Railtie

    config.pagers = ActiveSupport::OrderedOptions.new
    config.pagers.length = 20
    config.pagers.pages = 5
    config.pagers.padding = 0
    config.pagers.parameter = :p

    initializer 'pagers' do
      ::ActiveRecord::Base.send :include, Pagers::ActiveRecord::Base
      ::ActionView::Base.send :include, Pagers::ActionView::Base
    end

  end
end
