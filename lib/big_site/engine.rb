module BigSite
  class Engine < ::Rails::Engine
    isolate_namespace BigSite
    require_dependency 'big_site/action_controller_ext'
  end
end
