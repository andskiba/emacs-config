;;; as-theme.el --- My look and feel

;;; Commentary:

;;; Code:

(defvar as-fonts '("Dank Mono-16"
                   "Source Code Pro-12"
                   "Consolas-12"
                   "DejaVu Sans Mono-12"))

(defun as-preferred-font ()
  (or (car (seq-drop-while (lambda (elt) (null (x-list-fonts elt)))
                             as-fonts))
      "Dank Mono-16"))

(if (display-graphic-p)
    (set-face-attribute 'default nil :font (as-preferred-font)))

;; (disable-theme 'zenburn)
;; (enable-theme 'wombat)
;; (enable-theme 'zenburn)
;; (load-theme 'night-owl)
;; (disable-theme 'night-owl)
;; (load-theme 'deeper-blue)
;; (disable-theme 'deeper-blue)

(provide 'as-theme)

;;; as-theme.el ends here
