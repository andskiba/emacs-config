(use-package dockerfile-ts-mode
  :defer t
  :mode (("\\Dockerfile\\'" . dockerfile-ts-mode)
         ("\\.dockerignore\\'" . dockerfile-ts-mode)))

(provide 'as-dockerfile)
