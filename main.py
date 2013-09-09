#!/usr/bin/python2

import sys
import ConfigParser

sys.path.append('./lib')

from common_name import *
import worker 

def _conf_set_as_array(config, section_name, arg):
    return map(lambda x: x.strip(), config.get(section_name, arg).split(','))

_config = None
_loaded_conf = {}
_workers = []

def _init_conf(path):
    global _config
    global _loaded_conf

    _config = ConfigParser.SafeConfigParser()
    _config.read(path)

    _loaded_conf = {}
    _loaded_conf[VIMRC_PATH] = _config.get(SECT_COMMON, VIMRC_PATH)
    _loaded_conf[VIMRC_CONF_DIR] = _config.get(SECT_COMMON, VIMRC_CONF_DIR)
    _loaded_conf[VIMRC_PLUGIN_DIR] = _config.get(SECT_COMMON, VIMRC_PLUGIN_DIR)
    _loaded_conf[VIMERATOR_CONF_PATH] = _config.get(SECT_COMMON, VIMERATOR_CONF_PATH) 
    _loaded_conf[VIMERATOR_PLUGIN_PATH] = _config.get(SECT_COMMON, VIMERATOR_PLUGIN_PATH)
    _loaded_conf[VIMERATOR_PRESET_PATH] = _config.get(SECT_COMMON, VIMERATOR_PRESET_PATH)
    

def _init_workers():
    global _workers

    _workers.append(worker.WorkerDefaultConf())
    _workers.append(worker.WorkerPreset())
    _workers.append(worker.WorkerGeneralConf())
    _workers.append(worker.WorkerPlugin())

def _install_settings(sect_name):
    global _config
    global _loaded_conf
    global _workers

    _loaded_conf[VIMRC_CONF] = _conf_set_as_array(_config, sect_name, VIMRC_CONF)
    _loaded_conf[VIMRC_PLUGIN] = _conf_set_as_array(_config, sect_name, VIMRC_PLUGIN)

    for w in _workers:
        w.run_install(_loaded_conf)

def _uninstall_settings(sect_name):
    global _config
    global _loaded_conf
    global _workers

    _loaded_conf[VIMRC_CONF] = _conf_set_as_array(_config, sect_name, VIMRC_CONF)
    _loaded_conf[VIMRC_PLUGIN] = _conf_set_as_array(_config, sect_name, VIMRC_PLUGIN)

    for w in _workers:
        w.run_uninstall(_loaded_conf)

def main(argv):
    _init_conf('etc/vimerator.conf')
    _init_workers()

    if argv[1] == '-i':
        _install_settings('c++')
    elif argv[1] == '-u':
        _uninstall_settings('c++')

if __name__ == '__main__':
    main(sys.argv)
    print 'EOP'
