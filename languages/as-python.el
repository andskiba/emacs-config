(use-package
  eglot
  :ensure nil
  :config (add-to-list 'eglot-server-programs
                       '(python-ts-mode "/home/jedrek/.local/bin/pylsp")))

(use-package python-ts-mode
  :hook
  (python-ts-mode . eglot-ensure))

(provide 'as-python)
