(setq doom-font
      (font-spec
       :family "JetBrainsMono Nerd Font"
       :size 16
       :weight 'regular)
     doom-variable-pitch-font (font-spec :family "JetBrainsMono Nerd Font" :size 13))

(setq doom-theme 'doom-gruvbox)

(setq display-line-numbers-type `relative)

(setq select-enable-clipboard nil)

(setq org-directory "~/org/")
(setq org-hide-emphasis-markers nil)
(add-hook 'org-mode-hook #'auto-fill-mode)

(after! org
  (require 'ox-gfm))

(after! org
(add-hook 'org-mode-hook #'org-modern-mode))

(after! org
(add-hook 'org-mode-hook #'org-auto-tangle-mode))

(after! org
  (require 'org-tempo)
  (add-to-list 'org-structure-template-alist '("r" . "#+BEGIN_SRC rust")))

(after! org
  (setq org-latex-src-block-backend 'minted)
  (add-to-list 'org-latex-packages-alist '("" "minted")))

(after! org
  (setq! org-latex-pdf-process
       '("tectonic -X compile --outdir=%o -Z shell-escape -Z continue-on-errors %f")))

(use-package-hook! evil
  :pre-init
  (setq evil-respect-visual-line-mode t)
  t)

(after! org (guess-language-mode))

(after! lsp-mode
  (add-to-list 'lsp-language-id-configuration '(typst-ts-mode . "tinymist"))
  (lsp-register-client (make-lsp-client
                :new-connection (lsp-stdio-connection "tinymist")
                :major-modes '(typst-ts-mode)
                :server-id 'typst-lsp)))

(after! org (require 'ox-typst))
(after! org (require 'org-typst-preview))

(after! lsp-mode
  (lsp-register-client (make-lsp-client
                        :new-connection (lsp-stdio-connection "lua-language-server")
                        :major-modes '(lua-mode)
                        :server-id 'lua-language-server)))

(map!
 :nv "M-k" #'move-text-up
 :nv "M-j" #'move-text-down)

(after! ispell
  (setenv "LANG" "da_DK.UTF-8")

  (ispell-set-spellchecker-params)
  (ispell-hunspell-add-multi-dic "da_DK,en_US")
  )

(after! mu4e
  (setq sendmail-program (executable-find "msmtp")
        send-mail-function #'message-send-mail-with-sendmail
        message-sendmail-f-is-evil t
        message-sendmail-extra-arguments '("--read-envelope-from")
        message-send-mail-real-function #'message-send-mail-with-sendmail))

(set-email-account! "uni"
                    '((mu4e-sent-folder . "/uni/Sent")
                      (mu4e-drafts-folder . "/uni/Drafts")
                      (mu4e-trash-folder . "/uni/Trash")
                      (mu4e-refile-folder . "uni/Inbox")
                      (user-mail-address . "202106950@post.au.dk")
                      (smtpmail-smtp-server . "post.au.dk")
                      (smtpmail-smtp-service . 587)
                      (smtpmail-servers-requiring-authorization . "smtp\\.post\\.au\\.dk"))
                    t)

(set-email-account! "gmail"
                    '((mu4e-sent-folder . "/gmail/\[Gmail\]/Sendte\ mails")
                      (mu4e-drafts-folder . "/gmail/\[Gmail\]/Udkast")
                      (mu4e-trash-folder . "/gmail/\[Gmail\]/Papirkurv")
                      (mu4e-refile-folder . "/gmail/Arkiv")
                      (user-mail-address . "ugilt3@gmail.com")
                      (smtpmail-smtp-server . "gmail.com"))
                    t)

(evil-global-set-key 'normal "H" #'centaur-tabs-backward-tab)
(evil-global-set-key 'normal "L" #'centaur-tabs-forward-tab)

(after! 'calfw-ical
  (cfw:open-ical-calendar "https://calendar.google.com/calendar/u/0?cid=dWdpbHQzQGdtYWlsLmNvbQ"))
