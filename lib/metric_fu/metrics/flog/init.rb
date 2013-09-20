module MetricFu
  class MetricFlog < Metric
    require_relative 'flog'
    require_relative 'flog_grapher'

    def name
      :flog
    end

    def default_run_options
      { :dirs_to_flog => MetricFu::Io::FileSystem.directory('code_dirs'), :continue => true, :all => true, :quiet => true  }
    end

    def has_graph?
      true
    end

    def enable
      if MetricFu.configuration.mri?
        super
      else
        MetricFu.configuration.mf_debug("Flog is only available in MRI due to flog tasks")
      end
    end

    def activate
      activate_library 'flog'
      activate_library 'flog_cli'
      super
    end

  end
end
