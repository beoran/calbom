# Ultra simplistic data storage in pipe delimited text files.
=begin
module Calbom
  class Data
    def initialize(name, fields={})
      @name     = name
      @fields   = fields
      @data_map = {}
      @data_ary = []
    end

    def self.data_dir      
      return 'data' if File.exist?('data')
      return '.'
    end

    
    def read()
      fin = fopen(File.join(Data.data_dir, @name + '.txt')
      unless fin
        return nil
      end
    end
    
  end
end  
=end  



