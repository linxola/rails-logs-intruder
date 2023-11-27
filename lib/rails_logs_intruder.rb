# frozen_string_literal: true

require_relative "rails_logs_intruder/version"

# Module to output to Rails logs user's or default text
module RailsLogsIntruder
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  def self.put_message(message = nil)
    message ||= self.configuration.default_message
    puts message
  end

  # Class for RailsLogsIntruder configuration
  class Configuration
    attr_accessor :default_message

    def initialize
      @default_message = "
      ██╗  ██╗███████╗██╗     ██╗      ██████╗     ████████╗██╗  ██╗███████╗██████╗ ███████╗
      ██║  ██║██╔════╝██║     ██║     ██╔═══██╗    ╚══██╔══╝██║  ██║██╔════╝██╔══██╗██╔════╝
      ███████║█████╗  ██║     ██║     ██║   ██║       ██║   ███████║█████╗  ██████╔╝█████╗
      ██╔══██║██╔══╝  ██║     ██║     ██║   ██║       ██║   ██╔══██║██╔══╝  ██╔══██╗██╔══╝
      ██║  ██║███████╗███████╗███████╗╚██████╔╝       ██║   ██║  ██║███████╗██║  ██║███████╗
      ╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝ ╚═════╝        ╚═╝   ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚══════╝
      "
    end
  end
end
