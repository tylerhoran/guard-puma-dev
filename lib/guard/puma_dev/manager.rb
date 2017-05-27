require 'fileutils'

module Guard
  class PumaDev
    class Manager

      def restart
        _touch_tmp_restart
        _rm_tmp_restart
        _notify "PumaDev restarted."
      end

      private

      def _touch_tmp_restart
        FileUtils.mkdir('tmp') unless File.directory?("tmp")
        FileUtils.touch('tmp/restart.txt')

      end

      def _rm_tmp_restart
        FileUtils.rm('tmp/restart.txt')
      end

      def _notify(message)
        UI.info(message)
        Notifier.notify(message, title: "PumaDev", image: :success)
      end

    end
  end
end
