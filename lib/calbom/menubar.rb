# Wrapper class around
# SWT Menu and MenuItem classes
# This generates a simple, classic style menu bar
# with dropping-down submenus and menu items in those drop-downs

module  Calbom
  class MenuBar
    # Creates a new menu bar for the given swt Shell and sets it to the shell
    def initialize(shell)
      @shell    = shell
      @bar      = Menu.new(@shell, SWT::BAR)     
      @shell.setMenuBar(@bar)
      @submenus = {}
      @cascades = {}
      @items    = {}
    end

    # Creates a named submenu in this menu bar, or returns an existing submenu
    # if it already was created before.   
    def submenu(name)
      sname   = name.to_sym      
      return @submenus[sname] if @submenus[sname]
      cascade = MenuItem.new(@bar, SWT::CASCADE)
      cascade.setText(name)
      submenu = Menu.new(@shell, SWT::DROP_DOWN)
      cascade.setMenu(submenu)      
      @submenus[sname] = submenu
      @cascades[sname] = cascade
      return submenu
    end

    AMOD_MOD    = { :mod1 => SWT::MOD1, :mod2 => SWT::MOD2,
                    :mod1_2 => SWT::MOD1 | SWT::MOD2, :none => 0 }
    AMOD_NAME   = { :mod1 => "Ctrl+", :mod2 => "Alt+",
                    :mod1_2 => "Ctrl+Alt+", :none => '' }

    # Creates a menu item with the given action block on actvation
    # and with the given parameters under the named submenu name
    def item(submenuname, name, akey = nil, amod = :mod1, &block)
      subm  = self.submenu(submenuname)
      item  = MenuItem.new(subm, SWT::PUSH)
      text  = name
      if akey
        mod = AMOD_MOD[amod]  || 0
        nmo = AMOD_NAME[amod] || ''
        text+= "\t#{nmo}#{akey}"
        p "setAccelerator:", text.ord + mod, text
        key = 0
        if akey.size < 2
          key = akey.ord
        else
          key = SWT.const_get(akey.upcase)
        end   
        item.setAccelerator(key + mod)
      end
      item.setText(text)
      item.addSelectionListener(&block) if block
      @items["#{submenuname}_#{name}".to_sym] = item
      return item
    end
  end
end  
  