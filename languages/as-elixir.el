(require 'as-prog-utils)

(use-package
  eglot
  :ensure nil
  :config (add-to-list 'eglot-server-programs
                       '(elixir-ts-mode "/home/jedrek/software/elixir-ls/language_server.sh")))

(use-package
  elixir-ts-mode
  :ensure t
  :mode (("\\.ex\\'" . elixir-ts-mode)
         ("\\.exs\\'" . elixir-ts-mode)
         ("\\mix.lock\\'" . elixir-ts-mode))
  :hook
  (elixir-ts-mode . eglot-ensure)
  (elixir-ts-mode
   .
   (lambda ()
     (push '(">=" . ?\u2265) prettify-symbols-alist)
     (push '("<=" . ?\u2264) prettify-symbols-alist)
     (push '("!=" . ?\u2260) prettify-symbols-alist)
     (push '("==" . ?\u2A75) prettify-symbols-alist)
     (push '("=~" . ?\u2245) prettify-symbols-alist)
     (push '("<-" . ?\u2190) prettify-symbols-alist)
     (push '("->" . ?\u2192) prettify-symbols-alist)
     (push '("<-" . ?\u2190) prettify-symbols-alist)
     (push '("|>" . ?\u25B7) prettify-symbols-alist)))
  (before-save . as/maybe-format-buffer))

(use-package
  exunit
  :ensure t
  :diminish t
  :config
  (defvar-keymap my-elixir-map
    :doc "Elixir keybindings (bound to C-c m e)."
    "." #'exunit-verify-single
    "b" #'exunit-verify
    "u a" #'exunit-verify-all-in-umbrella
    "a" #'exunit-verify-all
    "l" #'exunit-rerun)
  (keymap-set my-map "e" my-elixir-map))

(provide 'as-elixir)
