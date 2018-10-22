#!/usr/bin/env python2
# encoding: utf-8

module_level_variable1 = 12345

module_level_variable2 = 98765

def function_with_types_in_docstring(param1, param2):
    pass

def module_level_function(param1, param2=None, *args, **kwargs):
    if param1 == param2:
        raise ValueError('param1 may not be equal to param2')
    return True


def example_generator(n):
    for i in range(n):
        yield i


class ExampleError(Exception):

    def __init__(self, msg, code):
        Exception.__init__()
        self.msg = msg
        self.code = code


class ExampleClass(object):

    def __init__(self, param1, param2, param3):
        self.attr1 = param1
        self.attr2 = param2
        self.attr3 = param3  #: Doc comment *inline* with attribute

        #: list of str: Doc comment *before* attribute, with type specified
        self.attr4 = ['attr4']

        self.attr5 = None
        """str: Docstring *after* attribute, with type specified."""

    @property
    def readonly_property(self):
        return 'readonly_property'

    @property
    def readwrite_property(self):
        return ['readwrite_property']

    @readwrite_property.setter
    def readwrite_property(self, value):
        pass

    def example_method(self, param1, param2):
        return True

    def __special__(self):
        pass

    def __special_without_docstring__(self):
        pass

    def _private(self):
        pass

    def _private_without_docstring(self):
        pass
