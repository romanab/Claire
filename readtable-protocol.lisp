(cl:in-package #:claire)

;;; Protocol class READTABLE. This class should not be instantiated
;;; directly.
(defclass readtable () ())

;;; This function is a generic version of the Common Lisp function
;;; GET-MACRO-CHARACTER.
(defgeneric get-macro-character (readtable character))
