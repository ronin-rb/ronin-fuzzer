#
# ronin-fuzzer - A Ruby library for generating, mutating, and fuzzing data.
#
# Copyright (c) 2006-2024 Hal Brodigan (postmodern.mod3 at gmail.com)
#
# This file is part of ronin-fuzzer.
#
# ronin-fuzzer is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published
# by the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# ronin-fuzzer is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with ronin-fuzzer.  If not, see <https://www.gnu.org/licenses/>.
#

require 'command_kit/commands'
require 'command_kit/commands/auto_load'

require 'ronin/core/cli/command'
require 'ronin/core/cli/help/banner'

module Ronin
  module Fuzzer
    class CLI

      include CommandKit::Commands
      include CommandKit::Commands::AutoLoad.new(
        dir:       "#{__dir__}/cli/commands",
        namespace: "#{self}::Commands"
      )
      include Core::CLI::Help::Banner

      command_name 'ronin-fuzzer'

    end
  end
end
