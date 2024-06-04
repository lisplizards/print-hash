# print-hash

> Hash-table printer

## Usage

Function `PRINT-HASH` prints a hash-table to a stream or symbol representing a stream.

Example:

```common-lisp
(foo.lisp.print-hash:print-hash
  (alexandria:alist-hash-table
   `(("foo" . "bar")
     ("baaz" . ,(alexandria:alist-hash-table
                 `(("quux" . "baar")
                   ("bar" . "foo")
                   ("baaz" . ,(alexandria:alist-hash-table
                               '(("foo" . "foo")))))))))
  t)

;; prints to *standard-output*:
;;
;; #{
;;   foo bar
;;   baaz #{
;;     quux baar
;;     bar foo
;;     baaz #{
;;       foo foo
;;     }
;;   }
;; }
```

## Installation

Not in Quicklisp, so clone to "local-projects/".

## Development

Run tests:

```common-lisp
(asdf:test-system :foo.lisp.print-hash)
```

## Author

* John Newton (<a href="mailto:jnewton@lisplizards.dev">jnewton@lisplizards.dev</a>)

## Copyright

Copyright (c) 2024 John Newton

## License

Apache-2.0
