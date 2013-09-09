#!/usr/bin/python2

import sys
import ConfigParser

sys.path.append('./lib')

from common_name import *
import constructor

def _test():
    conf = {}
    conf[VIMRC_PATH] = './test/.vim'
    conf[VIMERATOR_CONF_PATH] = 'etc/conf'
    conf[VIMERATOR_PLUGIN_PATH] = 'etc/plugin'
    conf[VIMERATOR_PRESET_PATH] = 'etc/preset'
    conf[VIMERATOR_CONFS_TO_BE_LOADED] = ['vimrc.common.setting', 'vimrc.sh.setting' ]
                                                           
    c = constructor.ConstructorDefaultConf()
    c.run(conf)

def _conf_set_as_array(config, section_name, arg):
    return map(lambda x: x.strip(), config.get(section_name, arg).split(','))

def _process_loop(section_name):
    config = ConfigParser.SafeConfigParser()
    config.read('etc/vimerator.conf')

    conf = {}
    conf[VIMRC_PATH] = config.get(SECT_COMMON, VIMRC_PATH)
    conf[VIMRC_CONF_DIR] = config.get(SECT_COMMON, VIMRC_CONF_DIR)
    conf[VIMRC_PLUGIN_DIR] = config.get(SECT_COMMON, VIMRC_PLUGIN_DIR)
    conf[VIMERATOR_CONF_PATH] = config.get(SECT_COMMON, VIMERATOR_CONF_PATH) 
    conf[VIMERATOR_PLUGIN_PATH] = config.get(SECT_COMMON, VIMERATOR_PLUGIN_PATH)
    conf[VIMERATOR_PRESET_PATH] = config.get(SECT_COMMON, VIMERATOR_PRESET_PATH)
    
    conf[VIMRC_CONF] = _conf_set_as_array(config, section_name, VIMRC_CONF)
    conf[VIMRC_PLUGIN] = _conf_set_as_array(config, section_name, VIMRC_PLUGIN)

    # default config
    default_conf_constructor = constructor.ConstructorDefaultConf()
    default_conf_constructor.run(conf)

    # install preset directories & files
    preset_constructor = constructor.ConstructorPreset()
    preset_constructor.run(conf)

    # install confs
    generalconf_constructor = constructor.ConstructorGeneralConf()
    generalconf_constructor.run(conf)

    # install plugin
    plugin_constructor = constructor.ConstructorPlugin()
    plugin_constructor.run(conf)
    
def main(argv):
    _process_loop('c++')

if __name__ == '__main__':
    main(sys.argv)
    print 'EOP'
