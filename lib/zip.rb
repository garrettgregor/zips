# frozen_string_literal: true

require 'csv'

class Zip
  attr_reader :file_path

  def initialize(file_path)
    @file_path = file_path
  end

  def make_zips
    h = {}
    (CSV.open file_path, headers: true, header_converters: :symbol).each do |row|
      h[row[:state_id]] = [] unless h[row[:state_id]]
      h[row[:state_id]] << row[:zip]
    end
    return h
  end
end
