require_relative 'cachewarp/version'

module CacheWarp
  class Base

    def self.source
      @source ||= self.read
    end

    def self.processed_source
      @processed_source ||= self.source.split("\n").uniq
    end

    private

    def self.read
      File.read(File.expand_path('book/dracula.txt'))
    end

  end
end
