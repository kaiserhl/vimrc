
from object_class import ObjectClass

class Foo(object):

    def __init__(self):
        self.obj = None

    def set_obj(self, obj: ObjectClass):
        self.obj = obj

    def run(self):
        self.obj.do()


if __name__ == '__main__':
    pass
