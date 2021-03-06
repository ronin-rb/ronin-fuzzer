require 'spec_helper'
require 'ronin/fuzzing/mutator'

describe Ronin::Fuzzing::Mutator do
  let(:string) { 'GET /one/two/three' }

  describe "#initialize" do
    subject { described_class }

    context "patterns" do
      let(:substitutions) { ['bar'] }

      it "should accept Regexps" do
        fuzzer = subject.new(/foo/ => substitutions)

        expect(fuzzer.rules).to have_key(/foo/)
      end

      context "when given Strings" do
        subject { described_class.new('foo' => substitutions) }

        it "should convert to Regexp" do
          expect(subject.rules).to have_key(/foo/)
        end
      end

      context "when given Symbols" do
        subject { described_class.new(:word => substitutions) }

        it "should lookup the Ronin::Support::Text::Patterns constant" do
          expect(subject.rules).to have_key(Ronin::Support::Text::Patterns::WORD)
        end
      end

      context "otherwise" do
        it "should raise a TypeError" do
          expect {
            subject.new(Object.new => substitutions)
          }.to raise_error(TypeError)
        end
      end
    end

    context "mutations" do
      let(:pattern) { /foo/ }

      it "should accept Enumerable values" do
        fuzzer = subject.new(pattern => ['bar'])

        expect(fuzzer.rules[pattern]).to eq(['bar'])
      end

      context "when given Symbols" do
        subject { described_class.new(pattern => :bad_strings) }

        it "should map to an Enumerator for a Fuzzing method" do
          expect(subject.rules[pattern]).to be_kind_of(Enumerable)
        end
      end

      context "otherwise" do
        it "should raise a TypeError" do
          expect {
            subject.new(pattern => Object.new)
          }.to raise_error(TypeError)
        end
      end
    end
  end

  describe "#each" do
    let(:string) { "foo bar" }

    subject { described_class.new(/o/ => ['0'], /a/ => ['@']) }

    it "should apply every combination of mutation rules" do
      expect(subject.each(string).to_a).to match_array([
        "f0o bar",
        "fo0 bar",
        "f00 bar",
        "foo b@r",
        "f0o b@r",
        "fo0 b@r",
        "f00 b@r"
      ])
    end

    context "when mutations contain Integers" do
      subject { described_class.new(/o/ => [48]) }

      it "should convert them to characters" do
        expect(subject.each(string).to_a).to match_array([
          "f0o bar",
          "fo0 bar",
          "f00 bar"
        ])
      end
    end

    context "when mutations contain Procs" do
      subject { described_class.new(/o/ => [lambda { |str| str.upcase }]) }

      it "should call them with the matched String" do
        expect(subject.each(string).to_a).to match_array([
          "fOo bar",
          "foO bar",
          "fOO bar"
        ])
      end
    end
  end
end
