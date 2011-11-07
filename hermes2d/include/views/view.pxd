cdef extern from "views/view.h" namespace "Hermes::Hermes2D::Views":
  enum ViewWaitEvent:
    HERMES_WAIT_CLOSE
    HERMES_WAIT_KEYPRESS

  struct WinGeom:
    int x
    int y
    int width
    int height

    WinGeom(int x, int y, int width, int height)

  enum ViewPaletteType:
    H2DV_PT_DEFAULT # -1, ///< Default palette. Depends on viewer.
    H2DV_PT_HUESCALE # 0, ///< A palette based on hue scale.
    H2DV_PT_GRAYSCALE # 1, ///< Greyscale.
    H2DV_PT_INVGRAYSCALE # 2, ///< Inverted grayscale.
    H2DV_PT_MAX_ID # 3 ///< Maximum ID of view palette type.

  cdef cppclass View:
    void init()
    View(char* title, WinGeom* wg)
    View(char* title)
    int  create()
    void close()
    void refresh()
    void set_title(char* title)
    void set_min_max_range(double min, double max)
    void auto_min_max_range()
    void get_min_max_range(double& min, double& max)
    void show_scale(bool show)
    void show_scale()
    void set_scale_position(int horz, int vert)
    void set_scale_size(int width, int height, int numticks)
    void set_scale_format(char* fmt)
    void fix_scale_width(int width)
    void fix_scale_width()
    void save_screenshot(char* bmpname, bool high_quality)
    void save_screenshot(char* bmpname)
    void save_numbered_screenshot(char* format, int number, bool high_quality)
    void save_numbered_screenshot(char* format, int number)
    void set_palette(ViewPaletteType type)
    void set_num_palette_steps(int num)
    void set_palette_filter(bool linear)
    void wait_for_keypress(char* text)
    void wait_for_keypress()
    void wait_for_close()
    void wait_for_draw()
    void wait(char* text)
    void wait(ViewWaitEvent wait_event, char* text)
    void wait(ViewWaitEvent wait_event)
    void wait()

