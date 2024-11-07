(defun as/maybe-format-buffer ()
  (when (bound-and-true-p eglot-managed-p)
    (eglot-format-buffer)))

(provide 'as-prog-utils)
