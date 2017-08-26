require "rails/generators"

module Kube
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      def install_assets
        template "kube_properties.scss", 'app/assets/stylesheets/_kube_properties.scss'
      end
    end
  end
end
