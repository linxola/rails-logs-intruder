# frozen_string_literal: true

RSpec.describe RailsLogsIntruder do
  describe "#self.configure" do
    it "can be received configuration params with a block" do
      described_class.configure do |config|
        config.default_message = "Hello World!"
      end
      expect(described_class.configuration.default_message).to eq("Hello World!")
    end
  end

  describe "#self.put_message" do
    before { described_class.configuration.default_message = "Hello World!" }

    it "puts user's message to Rails' logs" do
      expect { described_class.put_message("Test test test") }.to output("Test test test\n").to_stdout
    end

    it "puts default message to Rails' logs if user didn't pass any argument" do
      expect { described_class.put_message }.to output("Hello World!\n").to_stdout
    end
  end

  describe "Configuration" do
    subject(:configuration) { RailsLogsIntruder::Configuration.new }

    it "initializes default_message variable" do
      expect(configuration.default_message).to eq("
      ██╗  ██╗███████╗██╗     ██╗      ██████╗     ████████╗██╗  ██╗███████╗██████╗ ███████╗
      ██║  ██║██╔════╝██║     ██║     ██╔═══██╗    ╚══██╔══╝██║  ██║██╔════╝██╔══██╗██╔════╝
      ███████║█████╗  ██║     ██║     ██║   ██║       ██║   ███████║█████╗  ██████╔╝█████╗
      ██╔══██║██╔══╝  ██║     ██║     ██║   ██║       ██║   ██╔══██║██╔══╝  ██╔══██╗██╔══╝
      ██║  ██║███████╗███████╗███████╗╚██████╔╝       ██║   ██║  ██║███████╗██║  ██║███████╗
      ╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝ ╚═════╝        ╚═╝   ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚══════╝
      ")
    end
  end
end
