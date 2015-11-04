require "rails/generators/base"

module Administrate
  class ViewGenerator < Rails::Generators::Base
    private

    def self.template_source_path
      File.expand_path(
        "../../../app/views/administrate/application",
        __FILE__,
      )
    end

    def copy_resource_template(template_name)
      template_file = "#{template_name}.html.erb"

      copy_file(
        template_file,
        "app/views/admin/#{resource_path}/#{template_file}",
      )
    end

    def resource_path
      args.first.try(:underscore).try(:pluralize) || "application"
    end
  end
end