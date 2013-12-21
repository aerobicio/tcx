require "spec_helper"

describe Tcx::TcxFile do
  let(:tcx_file) { Tcx::TcxFile.new(tcx_data) }
  let(:tcx_data) { File.read("spec/files/FitnessHistoryDetail.tcx") }

  describe "#active_duration" do
    subject { tcx_file.active_duration }

    it { should == 2325.0200000 }
  end

  describe "#distance" do
    subject { tcx_file.distance }

    it { should == 8348.5039063 }
  end

  describe "#start_time" do
    subject { tcx_file.start_time }

    it { should == Time.parse("2007-08-07T02:42:41Z") }
  end

  describe "#end_time" do
    subject { tcx_file.end_time }

    it { should == Time.parse("2007-08-07T02:42:41Z") + BigDecimal.new("2325.0200000") }
  end
end
