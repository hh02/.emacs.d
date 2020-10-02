(use-package org
  :ensure nil
  :bind (("C-c a" . org-agenda)
         ("C-c b" . org-switchb)
         ("C-c c" . org-capture)
         ("C-c l" . org-store-link))
  :hook ((org-mode . visual-line-mode))
  :config
  ;; export markdown
  (add-to-list 'org-export-backends 'md)
  
  (setq org-tags-column -80
        org-log-done 'time
        org-startup-indented t
        org-pretty-entities nil
        org-M-RET-may-split-line nil)
  ;; org-hide-emphasis-markers t (to hide emphasis markup)

  ;; Prettify UI
  (use-package org-superstar
    :if (char-displayable-p ?⚫)
    :hook (org-mode . org-superstar-mode)
    :init (setq org-superstar-headline-bullets-list '("⚫" "⚫" "⚫" "⚫")))
  ;; (setq org-ellipsis (if (char-displayable-p ?⏷) " ⏷" nil))
  
  (use-package doom-themes 
    :config 
    ;; Corrects (and improves) org-mode's native fontification.
    (doom-themes-org-config))
  
  ;; <s Tab to completion org template
  ;;(require 'org-tempo)
  )
    
(provide 'init-org)
