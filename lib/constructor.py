import os
import common_name
import shutil

def _expand(path):
    return os.path.abspath(path)

class ConstructorInterface(object):
    def _load_conf(self, conf):
        self._vimrc_path = conf[common_name.VIMRC_PATH]
        self._vimrc_conf_dir = conf[common_name.VIMRC_CONF_DIR]
        self._vimrc_plugin_dir = conf[common_name.VIMRC_PLUGIN_DIR]

        self._vimerator_conf_path = conf[common_name.VIMERATOR_CONF_PATH]
        self._vimerator_plugin_path = conf[common_name.VIMERATOR_PLUGIN_PATH]
        self._vimerator_preset_path = conf[common_name.VIMERATOR_PRESET_PATH]

    def load_conf(self, conf):
        """
        """
        raise NotImplementedError('ConstructorInterface does not implement' 
                                  'load_conf')

    def pre_construct(self):
        """
        """
        raise NotImplementedError('ConstructorInterface does not implement' 
                                  'pre_construct')

    def construct(self):
        """
        """
        raise NotImplementedError('ConstructorInterface does not implement'
                                  'construct')

    def post_construct(self):
        """
        """
        raise NotImplementedError('ConstructorInterface does not implement'
                                  'post_construct')

    def run(self, conf):
        self._load_conf(conf)

        self.load_conf(conf)

        self.pre_construct()

        self.construct()

        self.post_construct()


class ConstructorDefaultConf(ConstructorInterface):
    VIMRC_DEFAULT_CONTENT = \
"""
"===============================================================================
" File:		vimrc.default
" Summary:	Loads up additional vimrc files that have decent defaults;
"		Also offers a decent function for loading those files.
"===============================================================================

"---------------------------------------- 
" Source the given file or fail out
"---------------------------------------- 
function! LoadFile(filename)
    let FILE=expand(a:filename)
    if filereadable(FILE)
        exe "source " FILE
    else
        echo "Can't source " FILE
    endif
endfunction

"---------------------------------------- 
" Pathogen, a vim package manager
"---------------------------------------- 
filetype on

call pathogen#infect()
call pathogen#helptags()

"---------------------------------------- 
" Load vim configurations
"---------------------------------------- 
"""

    def load_conf(self, conf):
        self.__confs_to_be_loaded = conf[common_name.VIMRC_CONF]

    def pre_construct(self):
        pass

    def construct(self):
        vimrc_default_dir_path = '%s/%s' % (self._vimrc_path, self._vimrc_conf_dir)
        vimrc_default_path = '%s/vimrc.default' % vimrc_default_dir_path

        if not os.path.exists(vimrc_default_dir_path):
            os.makedirs(vimrc_default_dir_path)

        with open(vimrc_default_path, 'w') as file_out:
            file_out.write(ConstructorDefaultConf.VIMRC_DEFAULT_CONTENT) 
            for conf in self.__confs_to_be_loaded:
                file_out.write('execute LoadFile("%s/%s")\n' % (vimrc_default_dir_path, conf))
    
    def post_construct(self):
        pass

class ConstructorPreset(ConstructorInterface):
    def load_conf(self, conf):
        pass

    def pre_construct(self):
        pass

    def construct(self):
        for v in os.walk(self._vimerator_preset_path):
            # TODO find a better way to compare current path with preset_path
            if v[0] == self._vimerator_preset_path:
                continue

            src_path = _expand(v[0])
            dst_path = _expand('%s/%s' % (self._vimrc_path, os.path.basename(src_path)))
            os.symlink(src_path, dst_path) 

    def post_construct(self):
        pass


class ConstructorGeneralConf(ConstructorInterface):
    def load_conf(self, conf):
        self.__confs_to_be_loaded = conf[common_name.VIMRC_CONF]

    def pre_construct(self):
        pass

    def construct(self):
        for conf_name in self.__confs_to_be_loaded:
            src_path = _expand('%s/%s' % (self._vimerator_conf_path, conf_name))
            dst_path = _expand('%s/%s/%s' % (self._vimrc_path, self._vimrc_conf_dir, conf_name))
            os.symlink(src_path, dst_path)

    def post_construct(self):
        pass

class ConstructorPlugin(ConstructorInterface):
    def load_conf(self, conf):
        self.__plugins_to_be_loaded = conf[common_name.VIMRC_PLUGIN]

    def pre_construct(self):
        pass

    def construct(self):
        vimrc_plugin_dir_path = '%s/%s' % (self._vimrc_path, self._vimrc_plugin_dir)

        if not os.path.exists(vimrc_plugin_dir_path):
            os.makedirs(vimrc_plugin_dir_path)

        for plugin_name in self.__plugins_to_be_loaded:
            src_path = _expand('%s/%s' % (self._vimerator_plugin_path, plugin_name))
            dst_path = _expand('%s/%s' % (vimrc_plugin_dir_path, plugin_name))
            os.symlink(src_path, dst_path)

    def post_construct(self):
        pass
