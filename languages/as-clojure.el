(use-package
  eglot
  :ensure nil
  :config (add-to-list 'eglot-server-programs
                       '(clojure-ts-mode "clojure-lsp")))

(use-package clj-refactor
  :ensure t)

(use-package clojure-mode
  :ensure t
  :mode
  (("\\.cljs?\\'" . clojure-mode)
   ("\\.edn\\'" . clojure-mode))
  :hook
  (clojure-mode . eglot-ensure)
  (clojure-mode . cider-mode)
  (clojure-mode . enable-paredit-mode)
  (clojure-mode . clj-refactor-mode)
  :after (clj-refactor))

;; clojure-ts-mode requires emacs-30.1 - for some reason it doesn't work for me...
;; (use-package clojure-ts-mode
;;   :ensure t
;;   :config
;;   (add-to-list 'major-mode-remap-alist '(clojure-mode clojure-ts-mode))
;;   :mode
;;   (("\\.cljs?\\'" . clojure-ts-mode)
;;    ("\\.edn\\'" . clojure-ts-mode))
;;   :hook
;;   (clojure-ts-mode . eglot-ensure)
;;   (clojure-ts-mode . cider-mode)
;;   (clojure-ts-mode . enable-paredit-mode)
;;   (clojure-ts-mode . clj-refactor-mode)
;;   :after (clj-refactor))

(use-package cider
  :ensure t)

(provide 'as-clojure)
