# frozen_string_literal: true

class AcceptanceGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('templates', __dir__)

  def copy_acceptance_test_file
    template 'acceptance.template', "spec/acceptance/#{file_name}_spec.rb"
  end
end
