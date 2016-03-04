(cl:in-package #:common-lisp-user)

(defpackage #:claire
  (:use #:common-lisp)
  (:shadow #:readtable
	   #:get-macro-character
	   #:set-macro-character
	   #:make-dispatch-macro-character
	   #:get-dispatch-macro-character
	   #:set-dispatch-macro-character
	   #:copy-readtable)
  (:export))
