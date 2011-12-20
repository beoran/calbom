module Calbom
  class Main
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
      @shell.pack
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