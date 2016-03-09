(cl:in-package #:claire)

(defvar *current-readtable*)

(defvar *current-reader-state*)

(defvar *current-syntax-type*)

(defvar *current-stream*)

(defgeneric reader-step (readtable state syntax))
