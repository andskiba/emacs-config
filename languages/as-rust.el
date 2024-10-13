(use-package rust-mode
  :ensure t
  :init
  (setq rust-mode-treesitter-derive t)
  :hook (rust-ts-mode . eglot-ensure))

(provide 'as-rust)
