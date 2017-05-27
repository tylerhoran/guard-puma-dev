require 'guard'
require 'guard/compat/plugin'

module Guard
  class PumaDev < Plugin
    require 'guard/puma_dev/manager'

    attr_accessor :manager

    def initialize(options = {})
      super
      @options = {
        restart_on_start: false,
        restart_on_reload: true
      }.merge(options)
      @manager = Manager.new
    end

    def start
      manager.restart if options[:restart_on_start]
    end

    def reload
      manager.restart if options[:restart_on_reload]
    end

    def run_on_changes(paths)
      manager.restart
    end

  end
end
