(cl:in-package #:claire)

;;; The protocol class for character syntax types.
(defclass character-syntax () ())

(defclass whitespace (character-syntax) ())

(defclass constituent (character-syntax) ())

(defclass invalid (character-syntax) ())

(defclass macro-character (character-syntax) ())

(defclass terminating-macro-character (macro-character) ())

(defclass non-terminating-macro-character (macro-character) ())

(defclass single-escape (character-syntax) ())

(defclass multiple-escape (character-syntax) ())
