#
# Calbom
# Load java and SWT

require 'java'

include_class "org.eclipse.swt.SWT"
# Neat little trick to include several classes from the same package.
%w(Display Shell Label Table TableColumn TableItem).each do
    |c|
    include_class "org.eclipse.swt.widgets." + c
end
%w(GridLayout GridData RowLayout).each do
    |c|
    include_class "org.eclipse.swt.layout." + c
end


module Calbom
  include_package 'org.eclipse.swt'
  include_package 'org.eclipse.swt.layout'
  include_package 'org.eclipse.swt.widgets'
  swt = org.eclipse.swt

  autoload :Grid, 'calbom/grid'
  autoload :Main, 'calbom/main' 

	def self.run
	  puts "Starting Calbom!"
    @main = Main.new
    @main.run
    puts "Calbom done!"
	end
end



