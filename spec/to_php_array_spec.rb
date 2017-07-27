require "spec_helper"

describe ToPhpArray do
  it "has a version number" do
    expect(ToPhpArray::VERSION).not_to be nil
  end

  describe ".dump" do
    it "works" do
      array = [1, 2]
      php = 'array(1, 2)'
      expect(ToPhpArray.dump(array)).to eq(php)

      array = [
        'foo',
        3,
        [4, 5]
      ]
      php = "array('foo', 3, array(4, 5))"
      expect(ToPhpArray.dump(array)).to eq(php)

      hash = {
        :foo => 1,
        2 => 3,
        'bar' => {
          4 => 5
        }
      }
      php = "array('foo' => 1, 2 => 3, 'bar' => array(4 => 5))"
      expect(ToPhpArray.dump(hash)).to eq(php)
    end

    it "works with wrap option" do
      array = [1, 2]
      php = <<-PHP
array(
    1,
    2
)
      PHP
      expect(ToPhpArray.dump(array, { :wrap => true })).to eq(php.chomp)

      array = [
        'foo',
        3,
        [4, 5],
      ]
      php = <<-PHP
array(
    'foo',
    3,
    array(
        4,
        5
    )
)
      PHP
      expect(ToPhpArray.dump(array, { :wrap => true })).to eq(php.chomp)

      hash = {
        :foo => 1,
        2 => 3,
        'bar' => {
          4 => 5,
          'baz' => {
            6 => 7
          }
        }
      }
      php = <<-PHP
array(
    'foo' => 1,
    2 => 3,
    'bar' => array(
        4 => 5,
        'baz' => array(
            6 => 7
        )
    )
)
      PHP
      expect(ToPhpArray.dump(hash, { :wrap => true })).to eq(php.chomp)
    end

    it "works with indent_size option" do
      array = [1, 2]
      php = <<-PHP
array(
  1,
  2
)
      PHP
      expect(ToPhpArray.dump(array, { :wrap => true, :indent_size => 2 })).to eq(php.chomp)
    end

    it "escape single quote" do
      array = [
        'foo\'bar\'baz'
      ]
      php = "array('foo\\'bar\\'baz')"
      expect(ToPhpArray.dump(array)).to eq(php)
    end

    describe ".to_php_array" do
      it "is extendable" do
        array = [1, 2]
        array.extend(ToPhpArray)
        php = 'array(1, 2)'
        expect(array.to_php_array).to eq(php)

        hash = {
          :foo => 1,
          2 => 3,
          'bar' => {
            4 => 5
          }
        }
        hash.extend(ToPhpArray)
        php = "array('foo' => 1, 2 => 3, 'bar' => array(4 => 5))"
        expect(hash.to_php_array).to eq(php)
      end
    end
  end
end
