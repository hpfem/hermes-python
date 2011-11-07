class PyViewWaitEvent:
    HERMES_WAIT_CLOSE,HERMES_WAIT_KEYPRESS=range(2)

cdef class PyWinGeom:
  def __cinit__(self, int x, int y, int width, int height):
    if (type(self)!=PyWinGeom):
      return
    self.thisptr = <WinGeom*> newBuffer(sizeof(WinGeom))
    self.thisptr.x = x
    self.thisptr.y = y
    self.thisptr.width = width
    self.thisptr.height = height
  def __dealloc__(self):
    delBuffer[WinGeom](self.thisptr)
  property x:
    def __set__(self, value):
      self.thisptr.x=value
    def __get__(self):
      return self.thisptr.x
  property y:
    def __set__(self, value):
      self.thisptr.y=value
    def __get__(self):
      return self.thisptr.y
  property width:
    def __set__(self, value):
      self.thisptr.width=value
    def __get__(self):
      return self.thisptr.width
  property height:
    def __set__(self, value):
      self.thisptr.height=value
    def __get__(self):
      return self.thisptr.height


class PyViewPaletteType:
  H2DV_PT_DEFAULT, H2DV_PT_HUESCALE, H2DV_PT_GRAYSCALE, H2DV_PT_INVGRAYSCALE, H2DV_PT_MAX_ID = range(-1,3)

cdef class PyView: #abstract
  def __dealloc__(self):
    del self.thisptr

  def init(self):
    self.thisptr.init()
  def  create(self):
    return self.thisptr.create()
  def close(self):
    self.thisptr.close()
  def refresh(self):
    self.thisptr.refresh()
  def set_title(self, char* title):
    self.thisptr.set_title(title)
  def set_min_max_range(self, double min, double max):
    self.thisptr.set_min_max_range(min, max)
  def auto_min_max_range(self):
    self.thisptr.auto_min_max_range()
  def get_min_max_range(self):
    """ returns [min max] (differs from C++ version)"""
    cdef double min = 0
    cdef double max = 0
    self.thisptr.get_min_max_range(min, max)
    return [min, max]
  def show_scale(self, show = None):
    if show is not None:
      self.thisptr.show_scale(show)
    else:
      self.thisptr.show_scale()
  def set_scale_position(self, int horz, int vert):
    self.thisptr.set_scale_position(horz, vert)
  def set_scale_size(self, int width, int height, int numticks):
    self.thisptr.set_scale_size(width, height, numticks)
  def set_scale_format(self, char* fmt):
    self.thisptr.set_scale_format(fmt)
  def fix_scale_width(self, width=None):
    if width!=None:
      self.thisptr.fix_scale_width(width)
    else:
      self.thisptr.fix_scale_width()
  def save_screenshot(self, char* bmpname, high_quality=None):
    if high_quality!=None:
      self.thisptr.save_screenshot(bmpname, high_quality)
    else:
      self.thisptr.save_screenshot(bmpname)
  def save_numbered_screenshot(self, char* format, int number, high_quality=None):
    if high_quality!=None:
      self.thisptr.save_numbered_screenshot(format, number, high_quality)
    else:
      self.thisptr.save_numbered_screenshot(format, number)
  def set_palette(self, ViewPaletteType type):
    self.thisptr.set_palette(type)
  def set_num_palette_steps(self, int num):
    self.thisptr.set_num_palette_steps(num)
  def set_num_palette_steps(self, int num):
    self.thisptr.set_num_palette_steps(num)
  def wait_for_keypress(self):
    self.thisptr.wait_for_keypress()
  def wait_for_close(self):
    self.thisptr.wait_for_close()
  def wait_for_draw(self):
    self.thisptr.wait_for_draw()
  def wait(self, wait_event=None, text=None):
    if isinstance(wait_event,str):
      text=wait_event
    if text is not None and wait_event is not None:
      self.thisptr.wait(wait_event, text)
    else:
      if wait_event is not None:
        self.thisptr.wait(<ViewWaitEvent> wait_event)
      else:
        if text is not None:
          self.thisptr.wait(<char*> text)
        self.thisptr.wait()

