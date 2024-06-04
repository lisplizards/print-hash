;; Copyright (c) 2024 John Newton
;; SPDX-License-Identifier: Apache-2.0

(defsystem "foo.lisp.print-hash"
  :version "1.0.0"
  :author "John Newton"
  :license "Apache-2.0"
  :homepage "https://github.com/lisplizards/print-hash"
  :bug-tracker "https://github.com/lisplizards/print-hash/issues"
  :source-control (:git "https://github.com/lisplizards/print-hash.git")
  :depends-on ()
  :components ((:module "src"
                :components
                ((:file "main" :depends-on ("package"))
                 (:file "package"))))
  :description "Hash-table printer"
  :in-order-to ((test-op (test-op "foo.lisp.print-hash/tests"))))

(defsystem "foo.lisp.print-hash/tests"
  :author "John Newton"
  :license "Apache-2.0"
  :depends-on ("foo.lisp.print-hash"
               "rove")
  :components ((:module "tests"
                :components
                ((:file "main" :depends-on ("package"))
                 (:file "package"))))
  :description "Test system for foo.lisp.print-hash"
  :perform (test-op (op c) (symbol-call :rove :run c)))
