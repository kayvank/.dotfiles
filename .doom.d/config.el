;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Kayvan Kazeminejad"
      user-mail-address "kayvan@q2io.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))
;;
 (setq doom-font (font-spec :family "Source Code Pro" :size 16 )
       doom-variable-pitch-font (font-spec :family "Source Code Pro" :size 17))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Documents/org/")
(setq org-roam-directory "~/Documents/org/roam")
(setq default-directory "~/Documents/org/notes"
      deft-extensions '("org" "txt")
      deft-recursive t)
(setq org-journal0-date-prefix "#TITLE: "
      org-journal-time-prfix "* "
      org-journal-date-prfix "%a, %Y-%m-%d"
      org-journal-file-format "%Y-%m-%d.org")
;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(global-set-key (kbd "C-c +") 'image-increase-size)
(global-set-key (kbd "C-c g") 'magit-file-dispatch)
(global-set-key (kbd "C-c z") 'zeal-at-point)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c n") 'avy-goto-char)
(global-set-key (kbd "<f5>") 'revert-buffer)
(global-set-key (kbd "C-x w") 'elfeed)
(global-set-key (kbd "<f8>") 'neotree-projectile-action)
(global-set-key (kbd "S-<f8>") 'neotree-toggle)
(global-set-key [f6] 'lsp-describe-thing-at-point)
(global-set-key (kbd "C-c C-g") 'helm-projectile-grep)
(global-set-key (kbd "C-c C-m i") 'lsp-ui-imenu)
(global-set-key (kbd "C-c C-m I") 'lsp-ui-imenu--kill)
(global-set-key (kbd "C-c C-m l") 'lsp-command-map)
(global-set-key (kbd "C-c C-a") 'lsp-ui-sideline-apply-code-actions)
(global-set-key (kbd "C-c C-m g") 'haskell-hoogle)
(global-set-key (kbd "C-c C-h") 'haskell-hoogle-lookup-from-website)
(global-set-key [f7] 'helm-projectile-grep)
;;
;; relie on build tool to reformat source code & refresh
(global-auto-revert-mode t)
(global-set-key (kbd "C-x k") 'kill-this-buffer)


(setq large-file-warning-threshold 100000000)
(setq auth-sources '("~/.authinfo.gpg")
      auth-source-cache-expiry nil)
(setq rmh-elfeed-org-files (list "~/.elfeed.org"))
(setq lsp-lens-enable t)
(evil-define-key 'normal lsp-mode-map (kbd "\\") lsp-command-map)

;;;;;;;;;; gnus ;;;;;;;;;;;
(use-package! gnus
  :config
  (setq
        gnus-select-method '(nnnil "")
        gnus-secondary-select-methods '(
                                        (nntp "news.gwene.org")
                                        (nnmaildir "q2io" (directory "~/.mail/gmail/q2io"))
                                        )

        gnus-parameters '(
                          ("q2io" (posting-style (
                                                  gcc "nnmaildir+q2io:Sent")
                                                 (From
                                                  (format "%s <%s>" user-full-name
                                                          (prot/auth-get-field "q2io" :user))))))
        gnus-gcc-mark-as-read t
        ;; (setq gnus-agent t)
        gnus-novice-user nil
        gnus-check-new-newsgroups 'ask-server
        gnus-read-active-file 'some
        gnus-use-dribble-file t
        gnus-always-read-dribble-file t
        gnus-agent-article-alist-save-format 1
        gnus-agent-cache t
        gnus-agent-confirmation-function 'y-or-n-p
        gnus-agent-consider-all-articles nil
        gnus-agent-directory "~/.news/agent/"
        gnus-agent-enable-expiration 'ENABLE
        gnus-agent-expire-all nil
        gnus-agent-expire-days 30
        gnus-agent-mark-unread-after-downloaded t
        gnus-agent-queue-mail t
        gnus-agent-synchronize-flags nil

        )
  :bind
  ("C-c m" . gnus)
)

(use-package! nnmail
  :config
  (setq
   nnmail-expiry-wait 30
   )
)

(use-package! gnus-art
  :after gnus
  :config
  (setq
        gnus-article-browse-delete-temp 'ask
        gnus-article-over-scroll nil
        gnus-article-show-cursor t
        gnus-article-sort-functions
                '((not gnus-article-sort-by-number)
                (not gnus-article-sort-by-date))
        gnus-article-truncate-lines nil
        gnus-html-frame-width 80
        gnus-html-image-automatic-caching t
        gnus-inhibit-images t
        gnus-max-image-proportion 0.7
        gnus-treat-display-smileys nil
        gnus-article-mode-line-format "%G %S %m"
        gnus-visible-headers
                '("^From:" "^Subject:" "^To:" "^Cc:" "^Newsgroups:" "^Date:"
                "Followup-To:" "Reply-To:" "^Organization:" "^X-Newsreader:"
                "^X-Mailer:")
        gnus-sorted-header-list gnus-visible-headers
  )
  :hook
  (gnus-article-mode-hook . (
                             lambda () (setq-local fill-column 80)
                             )
  )
  :bind (:map gnus-article-mode-map
              ("i" . gnus-article-show-images)
              ("s" . gnus-mime-save-part)
              ("o" . gnus-mime-copy-part))
  )
(use-package! epa-file
  :config
  (setq
        epa-file-cache-passphrase-for-symmetric-encryption nil
  )
  )

(use-package! message
  :config
  (setq
        mail-user-agent 'message-user-agent
        compose-mail-user-agent-warnings nil
        message-mail-user-agent nil
        mail-signature "\nBest wishes,\nKayvan Kazeminejad\nq2io.com\n"
        message-signature "\nBest wishes,\nKayvan Kazeminejad\nq2io.com\n"
        message-citation-line-format "%f [%Y-%m-%d, %R %z]:\n"
        message-citation-line-function 'message-insert-formatted-citation-line
        send-mail-function 'smtpmail-send-it
        message-send-mail-function 'smtpmail-send-it
        smtpmail-smtp-server	"smtp.gmail.com"
        smtpmail-smtp-server "smtp.gmail.com"
        smtpmail-smtp-service 587
        message-confirm-send nil
        message-kill-buffer-on-exit t
        message-wide-reply-confirm-recipients t
        message-default-charset 'utf-8
)

  (add-to-list 'mm-body-charset-encoding-alist '(utf-8 . base64))

(defun prot/message-header-add-gcc ()
    (if (gnus-alive-p)
        (progn
          (when (message-fetch-field "Gcc")
            (message-remove-header "Gcc"))
          (message-add-header "Gcc: nnmaildir+pub:Sent"))
      (message "Gnus is not running. No GCC field inserted.")))

  :hook (
         (message-header-setup-hook . prot/message-header-add-gcc)
         (message-setup-hook . message-sort-headers)
         )
  )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (setq
        gnus-gcc-mark-as-read t
        gnus-agent t
        gnus-novice-user nil
        gnus-summary-display-arrow t
  )

(when window-system
  (setq
        gnus-sum-thread-tree-indent "  "
        gnus-sum-thread-tree-root "" ;; "● ")
        gnus-sum-thread-tree-false-root "" ;; "◯ ")
        gnus-sum-thread-tree-single-indent ""
        gnus-sum-thread-tree-vertical        "│"
        gnus-sum-thread-tree-leaf-with-other "├─► "
        gnus-sum-thread-tree-single-leaf     "╰─► "
        gnus-summary-line-format (
                                  concat
                                        "%0{%U%R%z%}"
                                        "%3{│%}" "%1{%d%}" "%3{│%}" ;; date
                                        "  "
                                        "%4{%-20,20f%}"               ;; name
                                        "  "
                                        "%3{│%}"
                                        " "
                                        "%1{%B%}"
                                        "%s\n"
                                  )
  )
)


(use-package! erc
  :custom
  (erc-autojoin-channels-alist '(("freenode.net" "#archlinux" "#bash" "#bitcoin"
                                  "#emacs" "#latex" "#org-mode" "#haskell" "purescript")))
  (erc-autojoin-timing 'ident)
  (erc-fill-function 'erc-fill-static)
  (erc-fill-static-center 22)
  (erc-hide-list '("JOIN" "PART" "QUIT"))
  (erc-lurker-hide-list '("JOIN" "PART" "QUIT"))
  (erc-lurker-threshold-time 43200)
  (erc-prompt-for-nickserv-password nil)
  (erc-server-reconnect-attempts 5)
  (erc-server-reconnect-timeout 3)
  (erc-track-exclude-types '("JOIN" "MODE" "NICK" "PART" "QUIT"
                             "324" "329" "332" "333" "353" "477"))
  :config
  (add-to-list 'erc-modules 'notifications)
  (add-to-list 'erc-modules 'spelling)
  (erc-services-mode 1)
  (erc-update-modules))

(defun my/erc-start-or-switch ()
  "Connects to ERC, or switch to last active buffer."
  (interactive)
  (if (get-buffer "irc.freenode.net:6667")
      (erc-track-switch-buffer 1)
    (when (y-or-n-p "Start ERC? ")
      (erc :server "irc.freenode.net" :port 6667 :nick "rememberYou"))))

(defun my/erc-notify (nickname message)
  "Displays a notification message for ERC."
  (let* ((channel (buffer-name))
         (nick (erc-hl-nicks-trim-irc-nick nickname))
         (title (if (string-match-p (concat "^" nickname) channel)
                    nick
                  (concat nick " (" channel ")")))
         (msg (s-trim (s-collapse-whitespace message))))
    (alert (concat nick ": " msg) :title title)))
(defun my/erc-count-users ()
  "Displays the number of users connected on the current channel."
  (interactive)
  (if (get-buffer "irc.freenode.net:6667")
      (let ((channel (erc-default-target)))
        (if (and channel (erc-channel-p channel))
            (message "%d users are online on %s"
                     (hash-table-count erc-channel-users)
                     channel)
          (user-error "The current buffer is not a channel")))
    (user-error "You must first start ERC")))
;; (set-face-attribute 'aw-leading-char-face nil :height 400)
