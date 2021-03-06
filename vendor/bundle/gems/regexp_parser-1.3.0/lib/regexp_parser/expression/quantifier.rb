module Regexp::Expression
  class Quantifier
    MODES = [:greedy, :possessive, :reluctant]

    attr_reader :token, :text, :min, :max, :mode

    def initialize(token, text, min, max, mode)
      @token = token
      @text  = text
      @mode  = mode
      @min   = min
      @max   = max
    end

    def initialize_clone(other)
      other.instance_variable_set(:@text, text.dup)
      super
    end

    def to_s
      text.dup
    end
    alias :to_str :to_s

    def to_h
      {
        token: token,
        text:  text,
        mode:  mode,
        min:   min,
        max:   max,
      }
    end

    MODES.each do |mode|
      class_eval <<-RUBY, __FILE__, __LINE__ + 1
        def #{mode}?
          mode.equal?(:#{mode})
        end
      RUBY
    end
    alias :lazy? :reluctant?
  end
end
