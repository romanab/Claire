(cl:in-package #:claire)

;;; The classes representing reader state correspond to the numbered
;;; steps in section 2.2 of the Common Lisp HyperSpec.

;;; This class is the protocol class for all reader states.
(defclass reader-state () ())

;;; In state 1 of the reader, either end-of-file processing is
;;; performed, or a character is read and a new state is entered
;;; according to the syntax type of that character.
(defclass reader-state-1 (reader-state) ())
