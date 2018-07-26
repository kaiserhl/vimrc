#!/usr/bin/env python

"""
Illustration of Google Python Style Guide:
https://google-styleguide.googlecode.com/svn/trunk/pyguide.html

This module provides a class to play TicTacToe game.
"""

__author__ = "Gamer Dude"
__email__ = "gamerdude@gmail.com"
__copyright__ = "Copyright 2015, Big Game Corp."


# Standard
import math
import sys
# External
import py_game_opengl

INVALID_MOVE = -1

class TicTacToe(object):

    CELL_NUM = 9

    def __init__(self):
        """
        Game init method.
        """

        self.cur_move = None
        self.user_count = 0
        self.board = [None for _ in range(TicTacToe.CELL_NUM)]

        self.renderer = py_game_opengl.Simple_Renderer()
        self.renderer.init()

    def make_move(self, pos, move):
        """
        Make a move on the board.
        """

        self.board[pos] = move
        self.cur_move = move
        self.renderer.draw(self.board)

    def print_board(self):
        """
        Print the cells of board.
        """

        for i, move in enumerate(self.board):
            print i, ":", move


def main():
    print __doc__

if __name__ == "__main__":
    main()
    print 'EOP'
