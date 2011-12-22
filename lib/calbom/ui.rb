# helper functions for the user interface

module Calbom
  module Ui
    include_package 'org.eclipse.swt'
    include_package 'org.eclipse.swt.layout'
    include_package 'org.eclipse.swt.widgets'


    # translates symbols to SWT integer constants
    # by looking them up in the ZWT clkas after uppercasing them
    def self.sym_to_swt(sym)      
      return SWT.const_get(sym.to_s.upcase.to_sym)
    end

    # ors the styles together after looking them up
    def self.or_styles(*styles)
      res = 0
      for style in styles do
        aid = sym_to_swt(style)
        res |= aid
      end  
      return res      
    end
    
    # Creates a message box.
    def self.make_messagebox(shell, message = "", *styles)
      style = or_styles(*styles)
      box   = MessageBox.new(shell, style)
      box.setMessage(message) if message 
      return box
    end

    # Creates a message box and opens it.
    def self.messagebox(shell, message = "", *styles)
      box = make_messagebox(shell, message, *styles)
      return box.open()
    end
    
  end
end


