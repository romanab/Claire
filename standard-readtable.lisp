(cl:in-package #:claire)

(defclass standard-readtable (readtable)
  ((%syntax-types
    :initform (make-hash-table)
    :reader syntax-types)
   (%macro-characters
    :initform (make-hash-table)
    :reader macro-characters)
   (%dispatch-macro-characters
    :initform (make-hash-table)
    :reader dispatch-macro-characters)
   (%readtable-case
    :initform :upcase
    :accessor readtable-case)
   (%token-parser
    :initform (make-instance 'standard-token-parser)
    :accessor token-parser)))

(defmethod copy-readtable ((readtable standard-readtable))
  (let ((result (make-instance 'standard-readtable)))
    (maphash (lambda (key value)
	       (setf (gethash key (syntax-types result)) value))
	     (syntax-types readtable))
    (maphash (lambda (char entry)
	       (setf (gethash char (macro-characters result))
		     entry))
	     (macro-characters readtable))
    (maphash (lambda (char entry)
	       (let ((table (make-hash-table)))
		 (maphash (lambda (sub-char function)
			    (setf (gethash sub-char table) function))
			  entry)
		 (setf (gethash char (dispatch-macro-characters result))
		       table)))
	     (dispatch-macro-characters readtable))
    (setf (readtable-case result)
	  (readtable-case readtable))
    result))
