(cl:in-package #:claire)

(defmethod reader-step ((readtable standard-readtable)
			(state reader-state-1)
			(syntax end-of-file))
  (error 'reader-error))
