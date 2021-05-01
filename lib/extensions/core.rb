# frozen_string_literal: true

class String
  def to_boolean
    s = strip_downcase
    case s
    when 't', 'true', 'y', 'yes'
      true
    when 'f', 'false', 'n', 'no'
      false
    else
      ActiveRecord::Type::Boolean.new.cast(s)
    end
  end

  def shuffle
    chars.shuffle.join
  end

  def sanitize_sql
    ActiveRecord::Base.send(:sanitize_sql_like, squish)
  end

  delegate :downcase, to: :squish, prefix: true
  delegate :upcase, to: :squish, prefix: true
  delegate :downcase, to: :strip, prefix: true
  delegate :upcase, to: :strip, prefix: true
end

class NilClass
  def to_boolean
    false
  end
end

class TrueClass
  def to_boolean
    true
  end

  def to_i
    1
  end
end

class FalseClass
  def to_boolean
    false
  end

  def to_i
    0
  end
end

class Integer
  delegate :to_boolean, to: :to_s
end

class Hash
  def decamelize_keys
    deep_transform_keys { |key| key.to_s.underscore }
  end

  def camelize_keys
    deep_transform_keys { |key| key.to_s.camelize(:lower) }
  end
end

class Array
  def decamelize_objects
    map(&:decamelize_keys)
  end

  def camelize_objects
    map(&:camelize_keys)
  end
end
