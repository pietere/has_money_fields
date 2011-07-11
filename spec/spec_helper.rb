require 'active_record'

$LOAD_PATH << File.expand_path("../lib", File.dirname(__FILE__))

# ---- setup environment/plugin
ActiveRecord::Base.establish_connection({
  :adapter => "sqlite3",
  :database => ":memory:",
})

require 'lib/has_money_fields'
require 'spec/models'
