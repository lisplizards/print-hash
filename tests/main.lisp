;; Copyright (c) 2024 John Newton
;; SPDX-License-Identifier: Apache-2.0

(in-package #:foo.lisp.print-hash/tests)

(deftest print-hash
    (testing "prints an empty hash-table"
             (ok (equal "#{}" (print-hash (make-hash-table) nil))))

  (testing
   "prints a hash-table with a single entry"
   (ok (equal (print-hash (alexandria:alist-hash-table '(("foo" . "bar"))) nil)
              "#{
  foo bar
}")))

  (testing
   "prints a hash-table with a multiple entries"
   (ok (equal (print-hash (alexandria:alist-hash-table '(("foo" . "bar") ("baaz" . "quux"))) nil)
              "#{
  foo bar
  baaz quux
}")))

  (testing
   "prints nested hash-tables"
   (let ((hash-table (alexandria:alist-hash-table
                      `(("foo" . "bar")
                        ("baaz" . ,(alexandria:alist-hash-table
                                    `(("quux" . "baar")
                                      ("bar" . "foo")
                                      ("baaz" . ,(alexandria:alist-hash-table
                                                  '(("foo" . "foo")))))))))))
     (ok (equal (print-hash hash-table nil)
                "#{
  foo bar
  baaz #{
    quux baar
    bar foo
    baaz #{
      foo foo
    }
  }
}"))))

  (testing
   "allows setting the indentation level with *INDENTATION-SPACES*"
   (let ((hash-table (alexandria:alist-hash-table
                      `(("foo" . "bar")
                        ("baaz" . ,(alexandria:alist-hash-table
                                    `(("quux" . "baar")
                                      ("bar" . "foo")
                                      ("baaz" . ,(alexandria:alist-hash-table
                                                  '(("foo" . "foo"))))))))))
         (foo.lisp.print-hash::*indentation-spaces* 4))
     (ok (equal (print-hash hash-table nil)
                "#{
    foo bar
    baaz #{
        quux baar
        bar foo
        baaz #{
            foo foo
        }
    }
}")))))
