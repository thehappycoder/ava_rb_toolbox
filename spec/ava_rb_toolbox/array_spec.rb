require 'spec_helper'

describe Array do
  class Model < Struct.new(:name, :value)
  end

  context 'of models' do
    before(:all) do
      @model_a = Model.new('a', 1)
      @model_b = Model.new('b', 2)
      @model_c = Model.new('c', 3)
    end

    let(:enumerable) do
      [@model_a, @model_b, @model_c]
    end

    shared_examples_for 'group_by_unique' do
      it { should be_a(Hash) }
      it { should eq({'a' => @model_a, 'b' => @model_b, 'c' => @model_c}) }
    end

    describe "#group_by_unique(proc)" do
      subject do
        enumerable.ava.group_by_unique(proc {|item| item.name})
      end

      it_behaves_like 'group_by_unique'
    end

    describe "#group_by_unique(block)" do
      subject do
        enumerable.ava.group_by_unique(&:name)
      end

      it_behaves_like 'group_by_unique'
    end

    describe "#group_by_unique(proc, block)" do
      subject do
        enumerable.ava.group_by_unique(proc {|item| item.name}) do |item|
          item.name
        end
      end

      it_behaves_like 'group_by_unique'
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