;;; kwp-dev --- development configuration for kwp-emacs

;;; Code:

(defun add-line-numbers ()
  (linum-mode 1))
 
(defun local-comment-auto-fill ()
  (set (make-local-variable 'comment-auto-fill-only-comments) t)
  (auto-fill-mode t))
 
(require 'auto-complete)
(defun add-auto-complete ()
  (auto-complete-mode 1))
 
(defun dev-before-save-hook ()
  (add-hook 'before-save-hook 'delete-trailing-whitespace))
 
(defvar dev-hook nil
  "Hook that gets run on activation of any programming mode.")
(add-hook 'dev-hook 'add-line-numbers)
(add-hook 'dev-hook 'local-comment-auto-fill)
(add-hook 'dev-hook 'add-auto-complete)
(add-hook 'dev-hook 'dev-before-save-hook)
 
(defun run-dev-hook ()
  "Enable things that are convenient across all dev buffers."
  (interactive)
  (run-hooks 'dev-hook))

;; ----------------------------------------
;; load all of the kwp-dev-* configurations
(require 'kwp-dev-python)

(provide 'kwp-dev)

;;; kwp-dev.el ends here