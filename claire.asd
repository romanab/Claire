(cl:in-package #:asdf-user)

(defsystem claire
  :depends-on (:acclimation)
  :serial t
  :components
  ((:file "packages")
   (:file "readtable-protocol")
   (:file "character-syntax")
   (:file "standard-readtable")))
