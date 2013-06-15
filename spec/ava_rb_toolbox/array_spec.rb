require 'spec_helper'

describe Array do
  class Model < Struct.new(:name, :value)
  end

  context 'with array of models' do
    before(:all) do
      @model_a = Model.new('a', 1)
      @model_b = Model.new('b', 2)
      @model_c = Model.new('c', 3)
    end

    let(:enumerable) do
      [@model_a, @model_b, @model_c]
    end

    let(:function) do
      proc do |item|
        item.name
      end
    end

    describe "#group_by_unique" do
      subject do
        enumerable.ava.group_by_unique(function)
      end

      it { should be_a(Hash) }
      it { should eq({'a' => @model_a, 'b' => @model_b, 'c' => @model_c}) }
    end
  end

  context 'with empty array' do
    let(:enumerable) do
      []
    end

    let(:function) do
      proc do |item|
        item
      end
    end

    describe "#group_by_unique" do
      subject do
        enumerable.ava.group_by_unique(function)
      end

      it { should be_empty }
      it { should be_a(Hash) }
    end
  end

  context 'with nil argument' do
    let(:enumerable) do
      []
    end

    describe "#group_by_unique" do
      subject do
        enumerable.ava.group_by_unique(nil)
      end

      it { should be_empty }
    end
  end
end