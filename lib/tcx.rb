require "tcx/version"
require "tcx/tcx_file"

module Tcx
  def self.parse(tcx_data)
    TcxFile.new(tcx_data)
  end
end
