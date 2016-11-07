(add-to-list 'load-path "./elisp")

(setq package-archives '(
                         ("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))

(package-initialize)

(require 'use-package)

(use-package org
  :ensure t
  :mode ("\\.org$" . org-mode)
  :config (progn
            ;; behaviour
            (setq org-src-fontify-natively t ; fontify code blocks
                  org-hide-emphasis-markers t
                  org-enforce-todo-dependencies t ; enforce todo dependencies
                  org-habit-graph-column 128
                  org-agenda-tags-column -128
                  org-tags-column -120
                  org-startup-folded 'fold
                  org-log-into-drawer t
                  org-log-done t
                  org-export-coding-system 'utf-8
                  org-highlight-latex-and-related '(latex)
                  org-edit-src-content-indentation 0 ; don't indent source code
                  org-src-preserve-indentation t)))

(use-package ox-extra
  :config (ox-extras-activate '(ignore-headlines)))

(use-package org-ref)
