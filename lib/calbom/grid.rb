=begin
require 'java'
require 'open-uri'
require 'rss'

# include_class "org.eclipse.swt.SWT"

# # Neat little trick to include several classes from the same package.
# %w(Display Shell Label Table TableColumn TableItem Button).each do
#     |c|
#     include_class "org.eclipse.swt.widgets." + c
# end
# %w(GridLayout GridData).each do
#     |c|
#     include_class "org.eclipse.swt.layout." + c
# end

module Calbom
  class Grid
  attr_reader :shell, :display

  def initialize(shell, data)
    @shell     = shell
    @cols      = cols 
    gridlayout = GridLayout.new
    gridlayout.numColumns = 2
    @shell.setLayout(gridlayout)
    name = Label.new(shell, SWT::NONE)
    name.setText("Name:")
    name.setLayoutData(GridData.new(GridData::VERTICAL_ALIGN_END))
    Label.new(shell, SWT::NONE).setText(rss.channel.title)

    Label.new(shell, SWT::NONE).setText("URL:")
    Label.new(shell, SWT::NONE).setText(rss.channel.link)

    table = Table.new(shell, SWT::MULTI | SWT::BORDER | SWT::FULL_SELECTION)
    table.setLinesVisible(true)
    table.setHeaderVisible(true)

    gridData = GridData.new(GridData::FILL_BOTH)
    gridData.horizontalSpan = 2
    table.setLayoutData(gridData)

    # Set the header of columns.
    columns = %w(Title Date Author)
    columns.each{ |h| TableColumn.new(table, SWT::NONE).setText(h) }
    rss.channel.items.each do
      |i|
      item = TableItem.new(table, SWT::NONE)
      item.setText(0, i.title)
      item.setText(1, i.dc_creator)
      item.setText(2, i.date.to_s)
      puts i
    end
    # Each column then needs to be packed to display properly
    for i in 0...columns.size
      table.getColumn(i).pack()
    end

  end

  def show
    @shell.open
    while (!@shell.isDisposed) do
      @display.sleep unless @display.readAndDispatch
    end
    @display.dispose
  end

  def get_messages
    rss_content = ''
    # Read URL
    open(FEED_URL) { |f| rss_content = f.read }
    # and parse.  "false" means "no validation"
    RSS::Parser.parse(rss_content, false)
  end
end

RssViewer.new.show
=end