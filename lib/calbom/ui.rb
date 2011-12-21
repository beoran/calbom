# helper functions for the user interface

module Calbom
  module Ui

    # 
    def message
    
        ICON_ERROR, ICON_INFORMATION, ICON_QUESTION, ICON_WARNING, ICON_WORKING
    OK, OK | CANCEL
    YES | NO, YES | NO | CANCEL
    RETRY | CANCEL
    ABORT | RETRY | IGNORE
Events:
    (none)

Note: Only one of the styles ICON_ERROR, ICON_INFORMATION, ICON_QUESTION, ICON_WARNING and ICON_WORKING may be specified.

IMPORTANT: This class is not intended to be subclassed.

See Also:
    SWT Example: ControlExample, Dialog tab, Sample code and further information
Restriction:
    This class is not intended to be subclassed by clients.

Constructor Summary
MessageBox(Shell parent)
          Constructs a new instance of this class given only its parent.
MessageBox(Shell parent, int style)
          Constructs a new instance of this class given its parent and a style value describing its behavior and appearance.

Method Summary
 String   getMessage()
          Returns the dialog's message, or an empty string if it does not have one.
 int  open()
          Makes the dialog visible and brings it to the front of the display.
 void   setMessage(String string)
          Sets the dialog's message, which is a description of the purpose for which it was opened.
  end
end


