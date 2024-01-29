# This is just an example to get you started. You may wish to put all of your
# tests into a single file, or separate them into multiple `test1`, `test2`
# etc. files (better names are recommended, just make sure the name starts with
# the letter 't').
#
# To run these tests, simply execute `nimble test`.

import unittest

import linear_algebra

test "idklol":
  var lol: Vector3
  echo lol is VectorOrder[3]
  lol.x = 12
  echo lol
  
  var idk: Vector[12]
  idk[4] = 69
  echo idk

test "doing homework":
  var u = Vec3(1, 2, -1)
  var v = Vec3(2, 0, 4)

  echo (3 * u) - v
  echo magnitude((3 * u) - v)