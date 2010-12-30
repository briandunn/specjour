module Specjour::Cucumber
  class RunlistFormatter
    attr_reader :io
    def initialize(step_mother, io, options)
      @io = io
    end
    def scenario_name(keyword, name, file_colon_line, source_indent)
      io << file_colon_line << "\n" 
    end
    def after_features(steps)
      io.flush
      io.close
    end
  end
end
