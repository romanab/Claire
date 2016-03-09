(cl:in-package #:claire)

;;; The classes representing reader state correspond to the numbered
;;; steps in section 2.2 of the Common Lisp HyperSpec.

;;; This class can be used as a mixin for states that hold on to a
;;; single character.
(defclass character-mixin ()
  ((%character :initarg :character :reader character)))

;;; This class is the protocol class for all reader states.
(defclass reader-state () ())

;;; In state 1 of the reader, either end-of-file processing is
;;; performed, or a character is read and a new state is entered
;;; according to the syntax type of that character.
(defclass reader-state-1 (reader-state) ())

;;; According to section 2.2 of the Common Lisp HyperSpec, state 2 is
;;; entered only from state 1 when an invalid character is read.
;;; According that that section, in this state, an error of type
;;; reader-error is signaled.  However, such an error is signaled in
;;; state 8 and state 9, also when an invalid character is read.  It
;;; might be more useful then to enter state 2 from states 8 and 9 in
;;; this situation, rather than duplicating the code that signals an
;;; error.  That way, client code need only define one method for the
;;; processing of an invalid character.
(defclass reader-state-2 (reader-state character-mixin)
  ())
