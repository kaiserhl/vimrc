#!/usr/bin/python2

import sys
import os
import ConfigParser
import argparse

# change the current working directory
_vimerator_path = '/home/lightmanhk/Backup/repo/vimrc'
os.chdir(_vimerator_path)

sys.path.append('./lib')

from common_name import *
import worker 

_config = None
_loaded_conf = {}
_workers = []

def _conf_set_as_array(config, section_name, arg):
    retval = map(lambda x: x.strip(), config.get(section_name, arg).split(','))
    if retval == ['']:
        retval = []
    return retval

def _init_conf(path):
    global _config
    global _loaded_conf

    _config = ConfigParser.SafeConfigParser()
    _config.read(path)

    _loaded_conf = {}
    _loaded_conf[VIMRC_PATH] = os.path.abspath(os.path.expandvars(_config.get(SECT_COMMON, VIMRC_PATH)))
    _loaded_conf[VIMRC_CONF_DIR] = _config.get(SECT_COMMON, VIMRC_CONF_DIR)
    _loaded_conf[VIMRC_PLUGIN_DIR] = _config.get(SECT_COMMON, VIMRC_PLUGIN_DIR)

    _loaded_conf[VIMRC_COMMON_CONF] = _conf_set_as_array(_config, SECT_COMMON, VIMRC_COMMON_CONF)
    _loaded_conf[VIMRC_COMMON_PLUGIN] = _conf_set_as_array(_config, SECT_COMMON, VIMRC_COMMON_PLUGIN)

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

    assert sect_name != SECT_COMMON 

    _loaded_conf[VIMRC_CONF] = _loaded_conf[VIMRC_COMMON_CONF] + _conf_set_as_array(_config, sect_name, VIMRC_CONF) 
    _loaded_conf[VIMRC_PLUGIN] = _loaded_conf[VIMRC_COMMON_PLUGIN] + _conf_set_as_array(_config, sect_name, VIMRC_PLUGIN)

    for w in _workers:
        w.run_install(_loaded_conf)

def _uninstall_settings(sect_name):
    global _config
    global _loaded_conf
    global _workers

    assert sect_name != SECT_COMMON 

    _loaded_conf[VIMRC_CONF] = _loaded_conf[VIMRC_COMMON_CONF] + _conf_set_as_array(_config, sect_name, VIMRC_CONF) 
    _loaded_conf[VIMRC_PLUGIN] = _loaded_conf[VIMRC_COMMON_PLUGIN] + _conf_set_as_array(_config, sect_name, VIMRC_PLUGIN)

    for w in _workers:
        w.run_uninstall(_loaded_conf)

def _create_symbolic_link():
    pass

def main(argv):
    global _vimerator_path
    global _loaded_conf

    _init_conf('etc/vimerator.conf')
    _init_workers()

    parser = argparse.ArgumentParser(description = "vimerator")
    mutual_parser_group = parser.add_mutually_exclusive_group()
    mutual_parser_group.add_argument('--uninstall', '-u', help="name of the project")
    mutual_parser_group.add_argument('--install', '-i', help="name of the project")
    parser.add_argument('--symbolic', '-s', action='store_true', help="create a symbolic link")
    parser.add_argument('--verbose', '-v', action='store_true', help='verbose output')
    args = parser.parse_args(sys.argv[1:])

    _loaded_conf[VIMERATOR_OPT_SYMLINK] = args.symbolic
    _loaded_conf[VIMERATOR_OPT_VERBOSE] = args.verbose
    if args.install:
        _install_settings(args.install)
    if args.uninstall:
        _uninstall_settings(args.uninstall)

if __name__ == '__main__':
    main(sys.argv)
    print 'EOP'
