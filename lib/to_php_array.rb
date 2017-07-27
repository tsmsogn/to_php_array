require "to_php_array/version"

module ToPhpArray
  def to_php_array(options = {})
    ::ToPhpArray::dump(self, options)
  end

  def self.dump(value, options = {})
    options = {
      :wrap => false,
      :indent_size => 4,
      :depth => 0,
      :new_line => false
    }.merge(options)

    indent = " " * options[:indent_size] * options[:depth]

    case value
      when Hash
        key_options = options.merge({ :depth => options[:depth] + 1,
                                      :new_line => true })
        value_options = options.merge({ :depth => options[:depth] + 1,
                                        :new_line => false })
        lines = value.map do |key, value|
          "#{dump(key, key_options)} => #{dump(value, value_options)}"
        end
        if options[:wrap]
          res = "array(\n" + lines.join(",\n") + "\n" + indent + ")"
        else
          res = "array(" + lines.join(", ") + ")"
        end
      when Array
        value_options = options.merge({ :depth => options[:depth] + 1,
                                        :new_line => true })
        lines = value.map do |value|
          dump(value, value_options)
        end
        if options[:wrap]
          res = "array(\n" + lines.join(",\n") + "\n" + indent + ")"
        else
          res = "array(" + lines.join(", ") + ")"
        end
      when Fixnum
        res = "#{value.to_s}"
      when Symbol
        res = "'" + value.to_s.gsub(/\'/, "\\\\'") + "'"
      when String
        res = "'" + value.gsub(/\'/, "\\\\'") + "'"
    end

    if options[:wrap] && options[:new_line]
      indent + res
    else
      res
    end
  end
end
