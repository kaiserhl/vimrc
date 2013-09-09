import os

import common_name
from __common__ import *

class WorkerInterface(object):
    def load_conf(self, conf):
        self._vimrc_path = conf[common_name.VIMRC_PATH]
        self._vimrc_conf_dir = conf[common_name.VIMRC_CONF_DIR]
        self._vimrc_plugin_dir = conf[common_name.VIMRC_PLUGIN_DIR]

        self._vimerator_conf_path = conf[common_name.VIMERATOR_CONF_PATH]
        self._vimerator_plugin_path = conf[common_name.VIMERATOR_PLUGIN_PATH]
        self._vimerator_preset_path = conf[common_name.VIMERATOR_PRESET_PATH]

        self._load_other_conf(conf)

    def _load_other_conf(self, conf):
        """
        """
        pass

    def pre_install(self):
        """
        """
        pass

    def install(self):
        """
        """
        pass

    def post_install(self):
        """
        """
        pass

    def pre_uninstall(self):
        """
        """
        pass
                                
    def uninstall(self):            
        """
        """
        pass

    def post_uninstall(self):            
        """
        """
        pass

    def run_install(self, conf):
        """
        """
        self.load_conf(conf)

        if not os.path.exists(self._vimrc_path):
            os.makedirs(self._vimrc_path)

        self.pre_install()

        self.install()

        self.post_install()

    def run_uninstall(self, conf):
        """
        """
        self.load_conf(conf)

        self.pre_uninstall()

        self.uninstall()

        self.post_uninstall()
        
        if os.path.exists(self._vimrc_path) and os.listdir(self._vimrc_path) == []:
            os.rmdir(self._vimrc_path)


class WorkerDefaultConf(WorkerInterface):
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

    def _load_other_conf(self, conf):
        self.__confs_to_be_loaded = conf[common_name.VIMRC_CONF]

    def install(self):
        vimrc_default_dir_path = '%s/%s' % (self._vimrc_path, self._vimrc_conf_dir)
        vimrc_default_path = '%s/vimrc.default' % vimrc_default_dir_path

        if not os.path.exists(vimrc_default_dir_path):
            os.makedirs(vimrc_default_dir_path)

        with open(vimrc_default_path, 'w') as file_out:
            file_out.write(WorkerDefaultConf.VIMRC_DEFAULT_CONTENT) 
            for conf in self.__confs_to_be_loaded:
                file_out.write('execute LoadFile("%s/%s")\n' % (vimrc_default_dir_path, conf))
    
    def uninstall(self):            
        vimrc_default_dir_path = '%s/%s' % (self._vimrc_path, self._vimrc_conf_dir)
        vimrc_default_path = '%s/vimrc.default' % vimrc_default_dir_path

        os.remove(vimrc_default_path)
        if os.listdir(vimrc_default_dir_path) == []:
            os.rmdir(vimrc_default_dir_path)


class WorkerPreset(WorkerInterface):
    def install(self):
        for v in os.walk(self._vimerator_preset_path):
            # TODO find a better way to compare current path with preset_path
            if v[0] == self._vimerator_preset_path:
                continue

            src_path = expand(v[0])
            dst_path = expand('%s/%s' % (self._vimrc_path, os.path.basename(src_path)))
            os.symlink(src_path, dst_path) 

    def uninstall(self):            
        for v in os.walk(self._vimerator_preset_path):
            # TODO find a better way to compare current path with preset_path
            if v[0] == self._vimerator_preset_path:
                continue

            src_path = expand(v[0])
            dst_path = expand('%s/%s' % (self._vimrc_path, os.path.basename(src_path)))
            os.unlink(dst_path)

class WorkerGeneralConf(WorkerInterface):
    def _load_other_conf(self, conf):
        self.__confs_to_be_loaded = conf[common_name.VIMRC_CONF]

    def install(self):
        for conf_name in self.__confs_to_be_loaded:
            src_path = expand('%s/%s' % (self._vimerator_conf_path, conf_name))
            dst_path = expand('%s/%s/%s' % (self._vimrc_path, self._vimrc_conf_dir, conf_name))
            os.symlink(src_path, dst_path)

    def uninstall(self):            
        vimrcs_path = '%s/%s' % (self._vimrc_path, self._vimrc_conf_dir)

        # remove all symbolic links for configuration files
        for conf_name in self.__confs_to_be_loaded:
            path = expand('%s/%s' % (vimrcs_path, conf_name))
            os.unlink(path)

        # remove vimrcs if it is empty now
        if os.listdir(vimrcs_path) == []:
            os.rmdir(vimrcs_path)

class WorkerPlugin(WorkerInterface):
    def _load_other_conf(self, conf):
        self.__plugins_to_be_loaded = conf[common_name.VIMRC_PLUGIN]

    def install(self):
        vimrc_plugin_dir_path = '%s/%s' % (self._vimrc_path, self._vimrc_plugin_dir)

        if not os.path.exists(vimrc_plugin_dir_path):
            os.makedirs(vimrc_plugin_dir_path)

        for plugin_name in self.__plugins_to_be_loaded:
            src_path = expand('%s/%s' % (self._vimerator_plugin_path, plugin_name))
            dst_path = expand('%s/%s' % (vimrc_plugin_dir_path, plugin_name))
            os.symlink(src_path, dst_path)

    def uninstall(self):            
        vimrc_plugin_dir_path = '%s/%s' % (self._vimrc_path, self._vimrc_plugin_dir)

        # remove all symbolic links for plugins
        for plugin_name in self.__plugins_to_be_loaded:
            path = expand('%s/%s' % (vimrc_plugin_dir_path, plugin_name))
            os.unlink(path)

        if os.listdir(vimrc_plugin_dir_path) == []:
            os.rmdir(vimrc_plugin_dir_path)

