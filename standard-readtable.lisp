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

(defmethod initialize-instance :after ((object standard-readtable) &key)
  (loop for char in '(#\Tab #\Newline #\Linefeed #\Page #\Return #\Space)
	do (setf (gethash char (syntax-types object))
		 (make-instance 'whitespace :character char)))
  (loop for char in '(#\" #\' #\( #\) #\, #\; #\`)
	do (setf (gethash char (syntax-types object))
		 (make-instance 'terminating-macro-character :character char)))
  (setf (gethash #\# (syntax-types object))
	(make-instance 'non-terminating-macro-character :character #\#))
  (setf (gethash #\\ (syntax-types object))
	(make-instance 'single-escape :character #\\))
  (setf (gethash #\| (syntax-types object))
	(make-instance 'multiple-escape :character #\|))
  ;; Even though the default syntax type for the standard readtable is
  ;; CONSTITUENT, we enter pre-created instances for some constituent
  ;; characters into the hash table in order to avoid memory
  ;; allocation in the form of character syntax instances for
  ;; characters that occur frequently in input.
  (loop for char in '(#\! #\$ #\% #\& #\* #\+ #\- #\. #\/ #\:
		      #\< #\= #\> #\? #\@ #\[ #\] #\^ #\_ #\{ #\} #\~)
	do (setf (gethash char (syntax-types object))
		 (make-instance 'constituent :character char)))
  (loop for char in '(#\0 #\1 #\2 #\3 #\4 #\5 #\6 #\7 #\8 #\9)
	do (setf (gethash char (syntax-types object))
		 (make-instance 'constituent :character char)))
  (loop for char in '(#\A #\B #\C #\D #\E #\F #\G #\H #\I #\J #\K #\L #\M
		      #\N #\O #\P #\Q #\R #\S #\T #\U #\V #\W #\X #\Y #\Z)
	do (setf (gethash char (syntax-types object))
		 (make-instance 'constituent :character char)))
  (loop for char in '(#\a #\b #\c #\d #\e #\f #\g #\h #\i #\j #\k #\l #\m
		      #\n #\o #\p #\q #\r #\s #\t #\u #\v #\w #\x #\y #\z)
	do (setf (gethash char (syntax-types object))
		 (make-instance 'constituent :character char))))

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

(defmethod character-syntax ((readtable standard-readtable) character)
  (or (gethash character (syntax-types readtable))
      (make-instance 'constituent :character character)))
