from ranger.gui.colorscheme import ColorScheme
from ranger.gui.color import *

class ColorScheme(ColorScheme):

    def use(self, context):
        fg, bg, attr = default_colors

        if context.reset:
            return default_colors

        return fg, bg, attr

