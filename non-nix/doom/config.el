(setq doom-font (font-spec :family "Jetbrains Mono NerdFont" :size 30))

(setq doom-theme 'doom-gruvbox-light)

(setq display-line-numbers-type 'visual)

(add-hook 'org-mode-hook #'org-modern-mode)

(require 'typst-ts-mode)
(add-to-list 'auto-mode-alist '("\\.typ\\'" . typst-ts-mode))
(after! typst-ts-mode
  (add-hook 'typst-ts-mode-hook #'lsp)
  (add-hook 'typst-ts-mode-hook #'adaptive-wrap-prefix-mode)
  )

(after! lsp-mode
  (add-to-list 'lsp-language-id-configuration '(typst-ts-mode . "typst"))
  (lsp-register-client (make-lsp-client
                        :new-connection (lsp-stdio-connection "tinymist")
                        :major-modes '(typst-ts-mode)
                        :server-id 'tinymist)))

(setq org-typst-from-latex-environment #'org-typst-from-latex-with-naive
      org-typst-from-latex-fragment #'org-typst-from-latex-with-naive)
(after! org
  (require 'ox-typst))

(use-package! gleam-ts-mode
  :mode (rx ".gleam" eos))

(after! treesit
  (add-to-list 'auto-mode-alist '("\\.gleam$" . gleam-ts-mode)))

(after! gleam-ts-mode
  (unless (treesit-language-available-p 'gleam)
    (gleam-ts-install-grammar)))

(setq evil-snipe-scope 'visible)
