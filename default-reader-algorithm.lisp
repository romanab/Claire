(cl:in-package #:claire)

(defparameter *reader-state-2*
  (make-instance 'reader-state-2))

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
  (setf *current-reader-state*
	(make-instance 'reader-state-3)))

(defmethod reader-step ((readtable standard-readtable)
			(state reader-state-1)
			(syntax macro-character))
  (setf *current-reader-state*
	(make-instance 'reader-state-3)))
