(require 'as-prog-utils)

(use-package
  eglot
  :ensure nil
  :config (add-to-list 'eglot-server-programs
                       '(php-ts-mode "phpactor" "language-server")))

(use-package php-ts-mode
  :ensure t
  :mode (("\\.php\\'" . php-ts-mode))
  :hook
  (php-ts-mode . eglot-ensure)
  (before-save . as/maybe-format-buffer))

(provide 'as-php)
