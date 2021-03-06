(cl:in-package #:asdf-user)

(defsystem claire
  :depends-on (:acclimation)
  :serial t
  :components
  ((:file "packages")
   (:file "readtable-protocol")
   (:file "token-parser-protocol")
   (:file "standard-token-parser")
   (:file "character-syntax")
   (:file "standard-readtable")
   (:file "reader-state")
   (:file "stream-input")
   (:file "reader-algorithm")
   (:file "default-reader-algorithm")))
