;; Copyright (c) 2024 John Newton
;; SPDX-License-Identifier: Apache-2.0

(in-package #:cl-user)

(defpackage #:foo.lisp.print-hash/tests
  (:use #:cl #:rove)
  (:import-from #:foo.lisp.print-hash
                #:print-hash))
