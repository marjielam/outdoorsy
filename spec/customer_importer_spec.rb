require 'spec_helper'
require './customer_importer'

RSpec.describe CustomerImporter do
  context 'with a missing or invalid file name' do
    it 'raises an error if no file name is included' do
      expect{ CustomerImporter.new }.to raise_error ArgumentError
    end

    it 'raises an error if an empty string is passed' do
      expect{ CustomerImporter.new(file_name: '') }.to raise_error CustomerImporter::InvalidFileError
    end

    it 'raises an error if a file that does not exist is passed' do
      allow(File).to receive(:exists?).and_return false

      expect{ CustomerImporter.new(file_name: 'fake.txt') }.to raise_error CustomerImporter::InvalidFileError
    end

    it 'raises an error if a real file in an invalid format is passed' do
      allow(File).to receive(:exists?).and_return true
      allow(File).to receive(:extname).and_return '.xml'

      expect{ CustomerImporter.new(file_name: 'real.txt') }.to raise_error CustomerImporter::InvalidFileError
    end
  end
end
