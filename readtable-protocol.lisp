(cl:in-package #:claire)

;;; Protocol class READTABLE. This class should not be instantiated
;;; directly.
(defclass readtable () ())

;;; This function is a generic version of the Common Lisp function
;;; COPY-READTABLE.
(defgeneric copy-readtable (readtable))

;;; This function is a generic version of the Common Lisp function
;;; GET-MACRO-CHARACTER.
(defgeneric get-macro-character (readtable character))

;;; This function is a generic version of the Common Lisp function
;;; SET-MACRO-CHARACTER.
(defgeneric set-macro-character
    (readtable character function &optional non-terminating-p))

;;; This function is a generic version of the Common Lisp function
;;; READTABLE-CASE.
(defgeneric readtable-case (readtable))

;;; Return the current token parser of READTABLE.
(defgeneric token-parser (readtable))
