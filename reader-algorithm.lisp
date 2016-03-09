(cl:in-package #:claire)

(defvar *current-readtable*)

(defvar *current-reader-state*)

(defvar *current-syntax-type*)

(defgeneric reader-step (readtable state syntax))
