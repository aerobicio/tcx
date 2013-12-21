require "spec_helper"

describe Tcx::TcxFile do
  let(:tcx_file) { Tcx::TcxFile.new(tcx_data) }
  let(:tcx_data) { File.read("spec/files/FitnessHistoryDetail.tcx") }

  describe "#active_duration" do
    subject { tcx_file.active_duration }

    pending
  end

  describe "#distance" do
    subject { tcx_file.distance }

    pending
  end

  describe "#end_time" do
    subject { tcx_file.end_time }

    pending
  end

  describe "#start_time" do
    subject { tcx_file.start_time }

    pending
  end
end
