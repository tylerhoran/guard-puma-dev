require 'spec_helper'
require 'fileutils'
require 'guard/compat/test/helper'

describe Guard::PumaDev::Manager do
  let(:manager) { Guard::PumaDev::Manager.new }

  before {
    Guard::Compat::UI.stub(:info)
    Guard::Compat::UI.stub(:notify)
  }

  describe "#restart_puma_dev" do

    context "without tmp dir" do
      before { FileUtils.rm_rf('tmp') }

      it "creates tmp/restart.txt" do
        manager.restart
        expect(File.file?("tmp/restart.txt")).to be_falsey
      end
    end

    context "with tmp dir" do
      before {
        FileUtils.mkdir 'tmp' unless File.directory?("tmp")
        FileUtils.rm_rf('tmp/restart.txt')
      }

      it "creates tmp/restart.txt" do
        manager.restart
        expect(File.file?("tmp/restart.txt")).to be_falsey
      end
    end

    context "with tmp dir" do
      before {
        FileUtils.mkdir 'tmp' unless File.directory?("tmp")
        FileUtils.touch('tmp/restart.txt')
        sleep 1
      }

      it "touches tmp/restart.txt" do
        manager.restart
        expect(File.file?("tmp/restart.txt")).to be_falsey
      end
    end
  end

end
