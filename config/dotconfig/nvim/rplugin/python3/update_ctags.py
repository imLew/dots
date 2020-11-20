import pynvim
import os

@pynvim.plugin
class AutoCTagPlugin(object):

    def __init__(self, nvim):
        self.nvim = nvim

    @pynvim.autocmd('BufWritePost ', pattern='*.py') 
    def on_close(self, ):
        if "tag_list" in os.listdir(os.getcwd()):
            os.system("ctags -L tag_list")
