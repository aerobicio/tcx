require "spec_helper"

describe Tcx do
  describe ".parse" do
    subject(:tcx) { Tcx.parse(tcx_data) }

    let(:tcx_data) { File.read("spec/files/FitnessHistoryDetail.tcx") }

    it "should return an object that represents a TCX file" do
      tcx.is_a?(Tcx::TcxFile).should be_true
    end
  end
end
