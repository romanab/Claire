(cl:in-package #:asdf-user)

(defsystem claire
  :depends-on (:acclimation)
  :serial t
  :components
  ((:file "packages")))
