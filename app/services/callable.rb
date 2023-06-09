# frozen_string_literal: true

class Callable
  def self.call(*args, **kwargs)
    new(*args, **kwargs).call.tap do |result|
      return yield(result) if block_given?
    end
  end
end
