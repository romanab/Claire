(cl:in-package #:claire)

;;; Protocol class for syntax types.
(defclass syntax () ())

;;; This class is used as a syntax object when an END-OF-FILE was
;;; reached as a result of an attempt to read a character.
(defclass end-of-file (syntax) ())

;;; Protocol class for character syntax types.
(defclass character-syntax (syntax) ())

(defclass whitespace (character-syntax) ())

(defclass constituent (character-syntax) ())

(defclass invalid (character-syntax) ())

(defclass macro-character (character-syntax) ())

(defclass terminating-macro-character (macro-character) ())

(defclass non-terminating-macro-character (macro-character) ())

(defclass single-escape (character-syntax) ())

(defclass multiple-escape (character-syntax) ())

;;; Retrieve the syntax of CHARACTER in READTABLE.  The return value
;;; is an instance of (a subclass of) the class CHARACTER-SYNTAX
;;; describing the syntax of the CHARACTER in READTABLE.
(defgeneric character-syntax (readtable character))

;;; Set the syntax of CHARACTER in READTABLE to SYNTAX.  SYNTAX is an
;;; instance of (a subclass of) the class CHARACTER-SYNTAX describing
;;; the syntax of the character.
(defgeneric (setf character-syntax) (syntax readtable character))
