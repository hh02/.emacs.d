;; Automatic parenthesis pairing
(use-package elec-pair
  :ensure nil
  :hook (after-init . electric-pair-mode)
  :init
  (setq electric-pair-inhibit-predicate 'electric-pair-conservative-inhibit
        electric-pair-pairs
         '((34 . 34) (8216 . 8217) (8220 . 8221) (123 . 125))))

(provide 'init-edit)
