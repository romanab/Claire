(cl:in-package #:claire)

(defgeneric read-character-with-syntax-type (stream readtable))

(defmethod read-character-with-syntax-type (stream readtable)
  (let ((character (read-char stream nil nil)))
    (if (null character)
	(make-instance 'end-of-file)
	(character-syntax readtable character))))
