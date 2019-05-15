require 'spec_helper'

describe Flatten do
  describe 'Flatten' do
    context 'object' do
      let(:flatten) { Flatten.new([]) }
      it "respond to flat" do
        expect(flatten).to respond_to(:flat)
      end

    end

    context 'Simple array' do
      let(:flatten) { Flatten.new([[1, 2, [3]], 4]) }

      it "returns flat array" do
        expect(flatten.flat).to eq([1, 2, 3, 4])
      end
    end

    context 'Complex array' do
      let(:flatten) { Flatten.new([[[1, 2, [3]], 4]]) }

      it "returns flat array" do
        expect(flatten.flat).to eq([1, 2, 3, 4])
      end
    end

    context 'Array contains negative numbers' do
      let(:flatten) { Flatten.new([-1, -2, [-3, [-4]]]) }

      it "returns flat array contains negative numbers" do
        expect(flatten.flat).to eq([-1, -2, -3, -4])
      end
    end

    context 'Array contains strings' do
      let(:flatten) { Flatten.new([["1", 2, ["3"]], 4]) }

      it "returns flat array contains numbers" do
        expect(flatten.flat).to eq([1, 2, 3, 4])
      end
    end

    context 'Array contains chars' do
      let(:flatten) { Flatten.new(["a", [1, 2, [3]], 4, "b"]) }

      it "returns flat array contains numbers" do
        expect(flatten.flat).to eq([0, 1, 2, 3, 4, 0])
      end
    end

    context 'Array contains non numbers' do
      let(:flatten) { Flatten.new([1, [{"2": "3"}, [4, [5, [{}, []]]]]]) }

      it "returns flat array contains numbers" do
        expect(flatten.flat).to eq([1, 0, 4, 5, 0])
      end
    end

    context 'Empty array' do
      let(:flatten) { Flatten.new([]) }

      it "returns empty array" do
        expect(flatten.flat).to eq([])
      end
    end

    context 'String' do
      let(:flatten) { Flatten.new("") }

      it "returns empty array" do
        expect(flatten.flat).to eq([])
      end
    end
  end

end
