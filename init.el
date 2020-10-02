;; Load path
;; Optimize: Force "lisp"" and "site-lisp" at the head to reduce the startup time.
(defun update-load-path (&rest _)
  "Update `load-path'."
  (dolist (dir '("site-lisp" "lisp"))
    (push (expand-file-name dir user-emacs-directory) load-path)))
    
(advice-add #'package-initialize :after #'update-load-path)
(update-load-path)

(require 'init-package)
(require 'init-ui)
(require 'init-basic)
;;(require 'init-edit) ;; 自动补全括号
(require 'init-org)

