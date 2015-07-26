require 'spec_helper'

module Turbo
  describe CLI do
    subject { CLI.new }

    it 'should say hello to world' do
      expect(subject.hello("World")).to eq "Hello World"
    end
  end
end
