require 'guard/compat/test/helper'
require 'spec_helper'

describe Guard::PumaDev do
  let(:options) { { } }
  let(:plugin) { Guard::PumaDev.new(options) }

  describe '#initialize' do
    it 'instantiates manager with option' do
      expect(Guard::PumaDev::Manager).to receive(:new)
      plugin
    end
  end

  describe "start" do
    it "doesn't restart puma dev by default" do
      expect(plugin.manager).to_not receive(:restart)
      plugin.start
    end

    context "with restart_on_start option" do
      let(:options) { { restart_on_start: true } }

      it "restarts puma-dev" do
        expect(plugin.manager).to receive(:restart)
        plugin.start
      end
    end
  end

  describe "reload" do
    it "restarts puma-dev by default" do
      expect(plugin.manager).to receive(:restart)
      plugin.reload
    end

    context "with restart_on_reload option set to false" do
      let(:options) { { restart_on_reload: false } }

      it "doesn't restart puma-dev" do
        expect(plugin.manager).to_not receive(:restart)
        plugin.reload
      end
    end
  end

  describe "run_on_changes" do
    it "restarts puma-dev" do
      expect(plugin.manager).to receive(:restart)
      plugin.run_on_changes(["xxx"])
    end
  end

end
