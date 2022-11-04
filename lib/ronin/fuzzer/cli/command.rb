#
# ronin-fuzzer - A Ruby library for generating, mutating, and fuzzing data.
#
# Copyright (c) 2006-2022 Hal Brodigan (postmodern.mod3 at gmail.com)
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

require 'ronin/core/cli/command'
require 'ronin/fuzzer/root'

module Ronin
  module Fuzzer
    class CLI
      class Command < Core::CLI::Command

        man_dir File.join(ROOT,'man')

        bug_report_url 'https://github.com/ronin-rb/ronin-fuzzer/issues/new'

      end
    end
  end
end
