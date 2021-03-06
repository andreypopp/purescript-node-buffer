module Node.Buffer.Unsafe where

import Node.Buffer

-- |
-- Creates a new buffer slice that acts like a window on the original buffer. 
-- Writing to the slice buffer updates the original buffer and vice-versa.
--
-- This is considered unsafe as writing to a slice can result in action at a 
-- distance.
--
foreign import slice
  "function slice (start) { \
  \  return function (end) { \
  \    return function (buff) { \
  \      return buff.slice(start, end); \
  \    } \
  \  } \
  \}" :: Offset -> Offset -> Buffer -> Buffer