require 'spec_helper'

def assert_no_overriden_methods(klass, methods)
  methods.each do |method|
    location = klass.instance_method(method).source_location

    if location.nil? or !location[0].include?('ava_rb_toolbox')
      fail("Ava overrides already existing #{klass}##{method}")
    end
  end
end

klass = Array

describe "#{klass} without toolbox" do
  it 'does not have any methods the ava overrides' do
    methods = [:ava]
    assert_no_overriden_methods(klass, methods)
  end
end