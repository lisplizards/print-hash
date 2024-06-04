;; Copyright (c) 2024 John Newton
;; SPDX-License-Identifier: Apache-2.0

(in-package #:foo.lisp.print-hash)

(defparameter *indentation-spaces* 2)

(declaim (ftype (function (hash-table (or boolean stream) &optional fixnum) (or null string)) print-hash))
(defun print-hash (hash-table destination &optional (indent 0))
  "Prints HASH-TABLE to DESTINATION, a stream or boolean, recursing when
the entry value is a hash-table. The output is formatted so that
hash-tables are presented with a map-like syntax, i.e., `#{}'.
Special variable *INDENTATION-SPACES* controls the indentation amount."
  (declare (type hash-table hash-table)
           (type (or boolean stream) destination)
           (type fixnum indent))
  (if (zerop (the fixnum (hash-table-count hash-table)))
      (format destination "#{}")
      (format destination "#{~%~{~v@T~A ~A~%~}~v@T}"
              (loop for key being the hash-keys of hash-table
                    for value being the hash-values of hash-table
                    append (let ((indent-amount (+ (the fixnum *indentation-spaces*)
                                                   indent)))
                             (declare (type fixnum indent-amount))
                             (list
                              indent-amount
                              key
                              (if (hash-table-p value)
                                  (print-hash value destination indent-amount)
                                  value))))
              indent)))
