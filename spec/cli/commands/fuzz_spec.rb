require 'spec_helper'
require 'ronin/fuzzer/cli/commands/fuzz'
require_relative 'man_page_example'

describe Ronin::Fuzzer::CLI::Commands::Fuzz do
  include_examples "man_page"
end
