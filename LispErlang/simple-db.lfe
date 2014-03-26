(defmodule simple-db
  (export all))

(defun make-cd (title artist rating ripped)
  (tuple 'title title
         'artist artist
         'rating rating
         'ripped ripped))