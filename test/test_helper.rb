require 'I18n'
I18n.available_locales = [:en, :pl]

require 'test/unit'
require 'active_support'
require 'active_support/test_case'
require 'logger'

require 'translated-accessors'

plugin_test_dir = File.dirname(__FILE__)

ActiveRecord::Base.logger = Logger.new(File.join(plugin_test_dir, "debug.log"))
ActiveRecord::Base.configurations = YAML::load(  IO.read( File.join(plugin_test_dir, 'db', 'database.yml')  ) )
ActiveRecord::Base.establish_connection("sqlite3mem")
ActiveRecord::Migration.verbose = false
load(File.join(plugin_test_dir, "db", "schema.rb"))
