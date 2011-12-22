module Calbom
  class Main
    ABOUT_TEXT = "Copyright Beoran 2011. May be distributed under the zlib license."
  
    def initialize
      @display = Display.new
      @shell  = Shell.new(display)
      @shell.setSize(800, 600)
      @shell.setText("Calbom - Main Window")
      @layout = RowLayout.new
      @layout.wrap = true
      @shell.setLayout @layout
      @label = Label.new(@shell, SWT::CENTER)
      @label.setText "Push the button"
      @button = org.eclipse.swt.widgets.Button.new(@shell, SWT::PUSH)
      @button.setText("Please Push Me!")
#       listener =  org.eclipse.swt.events.SelectionAdapter.new()
#       def listener.widgetSelected(event)
#         @button.setText("Thank You!")
#       end
      @button.addSelectionListener do |*args|
        p args[0]
        p args[0].methods - Object.methods
        @button.setText("Thank You!")
      end
      
      @bar      = MenuBar.new(@shell)
      # @bar.submenu('&File')
      @bar.item('&File', '&Save', 'S', :mod1) do
        puts "Should Save!"
      end
      @bar.item('&File', '&Open', 'O', :mod1) do
        puts "Should Open!"
      end
      
      @bar.item('&Help', '&How To Use', 'F1', :none) do
        res = Ui.messagebox(@shell, "This will be some short help.",
                            :icon_information, :ok)
        puts "Should Show help!"
      end
      @bar.item('&Help', '&About', 'A', :mod1) do
        res = Ui.messagebox(@shell, ABOUT_TEXT,
                            :icon_information, :ok)
      
        puts "Should About!"        
      end
      
#       @shell.setMenuBar(@bar)
#       @fileitem = MenuItem.new(@bar, SWT::CASCADE)
#       @fileitem.setText("&File");
#       @submenu  = Menu.new(@shell, SWT::DROP_DOWN);
#       @fileitem.setMenu(@submenu);
#       @item     = MenuItem.new(@submenu, SWT::PUSH);
#       @item.setText("&Save\tCtrl+S");
#       @item.setAccelerator( "A".ord + SWT::MOD1);
#       @item.addSelectionListener do
#         puts "Should Save!"
#       end
      # @shell.pack
    end

    
    def run
      @shell.open
      while (!@shell.isDisposed) do
        @display.sleep unless @display.readAndDispatch
      end
      @display.dispose
    end    
  end
end


if __FILE__ == $0
  Calbom::Main.run
end

