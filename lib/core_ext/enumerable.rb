module Enumerable
  def map_into(into = nil)
    return self unless into
    raise ArgumentError, "argument must respond to []" unless into.respond_to?(:[])

    map do |element|
      into[element]
    end
  end

  def map_to(to = nil)
    return self unless to
    raise ArgumentError, "argument must respond to new" unless to.respond_to?(:new)

    map do |element|
      to.new(element)
    end
  end
end