;;; insert-include-guards.el --- Insert C/C++ include guards into the buffer

;; Copyright (C) 2019  Ales Cepek <cepek@gnu.org>

;; Version: 1.00

;; This package is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This package is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

(defun insert-include-guards()
  (defun header-guard()
    (upcase (replace-regexp-in-string  "['\\''/'-.]" "_" (buffer-name)))
    )
  (interactive)
  (goto-char (point-min))
  (insert (format "#ifndef %s\n" (header-guard)))
  (insert (format "#define %s\n\n" (header-guard)))
  (goto-char (point-max))
  (insert (format "\n#endif // %s\n" (header-guard)))
  )
