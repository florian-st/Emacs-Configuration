;;; build.el --- Batch tangle entry point -*- lexical-binding: t; -*-

(require 'org)
(require 'ob-tangle)

;; No prompts during batch tangling.
(setq org-confirm-babel-evaluate nil)

(let* ((root (file-name-directory (or load-file-name default-directory)))
       (orgfile (expand-file-name "config.org" root)))
  (unless (file-exists-p orgfile)
    (error "Missing config.org at %s" orgfile))

  ;; Tangle according to :tangle headers in config.org
  (message "Tangling %s ..." orgfile)
  (org-babel-tangle-file orgfile)

  (message "Done."))
