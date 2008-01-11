module RKelly
  module JS
    class Object < Base
      attr_reader :value
      class << self
        def create(*args)
          arg = args.first
          return self.new if arg.nil? || arg == :undefined
	  case arg
	  when true, false
	    JS::Boolean.new(arg)
	  end
        end
      end

      def initialize(*args)
        super()
        if args.first.nil?
          self['protytpe'] = self
          self['valueOf'] = lambda { self }
        end
      end
    end
  end
end
