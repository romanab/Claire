(cl:in-package #:claire)

(defparameter *reader-state-2*
  (make-instance 'reader-state-2))

(defparameter *reader-state-3*
  (make-instance 'reader-state-3))

(defparameter *reader-state-4*
  (make-instance 'reader-state-4))

(defparameter *reader-state-5*
  (make-instance 'reader-state-5))

(defmethod reader-step ((readtable standard-readtable)
			(state reader-state-1)
			(syntax end-of-file))
  (error 'reader-error))

(defmethod reader-step ((readtable standard-readtable)
			(state reader-state-1)
			(syntax invalid))
  (setf *current-reader-state* *reader-state-2*))

(defmethod reader-step ((readtable standard-readtable)
			(state reader-state-1)
			(syntax whitespace))
  (setf *current-reader-state* *reader-state-3*))

(defmethod reader-step ((readtable standard-readtable)
			(state reader-state-1)
			(syntax macro-character))
  (setf *current-reader-state* *reader-state-4*))
