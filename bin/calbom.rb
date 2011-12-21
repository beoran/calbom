calbom_home = ENV['CALBOM_HOME'] || '/usr/local/share/calbom'
$: << calbom_home + '/lib'
$: << './lib'
$: << '../lib'
require 'swt-x86-linux.jar'
require 'calbom'
Calbom.run
