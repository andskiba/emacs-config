(require 'as-prog-utils)

(use-package go-ts-mode
  :mode (("\\.go\\'" . go-ts-mode))
  :config
  (setq go-ts-mode-indent-offset 4)
  :hook
  (go-ts-mode . (lambda ()
				  (eglot-ensure)
				  (indent-tabs-mode)
				  (whitespace-mode)
				  (setq tab-width 4)))
  (before-save . as/maybe-format-buffer))

(provide 'as-go)
