(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(starter-kit
                      starter-kit-lisp
                      starter-kit-js
                      php-mode
                      clojure-mode
                      clojure-test-mode
                      rainbow-delimiters
                      clojurescript-mode
                      exec-path-from-shell)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(require 'cc-mode)

(require 'auto-complete-config)
;(add-to-list 'ac-dictionary-dictionaries "~/.emacs.d/elpa/auto-complete-1.4/dict")
(ac-config-default)

(global-font-lock-mode 1)

(defun clojure-mode-init ()
  (global-set-key (kbd "C-c C-j") 'clojure-jack-in))

(add-hook 'clojure-mode-hook 'clojure-mode-init)

(add-hook 'nrepl-interaction-mode-hook
          'nrepl-turn-on-eldoc-mode)

(add-hook 'nrepl-mode-hook 'subword-mode)
(add-hook 'nrepl-mode-hook 'paredit-mode)
(add-hook 'nrepl-mode-hook 'rainbow-delimiters-mode)

(setq nrepl-hide-special-buffers t)
(setq nrepl-popup-stacktraces nil)
(setq nrepl-popup-stacktraces-in-repl t)

(add-to-list 'same-window-buffer-names "*nrepl*")

(require 'php-mode)

(defun php-mode-init ()
  "Set some buffer local variables"
  (electric-indent-mode t)
  (paredit-mode t)
  (setq case-fold-search t)
  (setq c-basic-offset 2)
  (setq fill-column 78)
  (c-set-offset 'case-label 2)
  (c-set-offset 'arglist-cont 0)
  (c-set-offset 'arglist-close 0)
  (c-set-offset 'arglist-intro '+))

(add-hook 'php-mode-hook 'php-mode-init)
(add-hook 'java-mode-hook 'php-mode-init)

(require 'coffee-mode)
(add-hook 'coffee-mode-hook (lambda ()
          ;; Turn on auto-complete
          (auto-complete-mode 1)
          ;; Turn on ElDoc Mode
          (eldoc-mode 1)
          ;; Set my coffee command
          (setq coffee-command "/usr/local/bin/coffee")
          ;; This stops compiled files from being wrapped
          (setq coffee-args-compile '("-c" "-b"))))

(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))

;; Enable paredit for a couple for non lisp modes; tweak
;; paredit-space-for-delimiter-predicates to avoid inserting spaces
;; before open parens.
(dolist (mode '(php javascript c++ c coffee java javap erlang))
  (auto-complete-mode 1)
  (add-hook (intern (format "%s-mode-hook" mode))
            '(lambda ()
               (add-to-list (make-local-variable 'paredit-space-for-delimiter-predicates)
                            (lambda (_ _) nil)))))

(setq indent-tabs-mode nil)

(add-hook 'haskell-mode-hook (lambda ()
                               (haskell-indentation-mode)))

(require 'markdown-mode)
(add-hook 'markdown-mode
          (lambda ()
            (markdown-command "/usr/local/bin/markdown")))

(add-to-list 'auto-mode-alist '("\\.markdown$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))

(add-to-list 'auto-mode-alist '("\\.vert$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.frag$" . c++-mode))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (deeper-blue)))
 '(inhibit-startup-screen t)
 '(show-paren-mode t)
 '(coffee-tab-width 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(add-to-list 'auto-mode-alist '("\\.module$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.install$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.engine$" . php-mode))

(setq show-paren-mode t)

;; Add my trigger for erlang mode for .erl files
(add-to-list 'auto-mode-alist '("\\.erl$" . erlang-mode))

;; Setup my clojure run-lisp environment
(setq inferior-lisp-program "lein repl")

;; Set my Command key to be my meta key for added shenanigans
(setq ns-command-modifier 'meta)

;; Turn off hl-mode
(hl-line-mode 0)

(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

(setq org-agenda-files (list "~/Dropbox/org/sean.org"))

(setq temporary-file-directory "/Users/manky/Documents/temp/")

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(set-face-attribute 'default (selected-frame) :height 98)

(setq exec-path (cons (expand-file-name "~/.rvm/gems/ruby-1.9.3-p385/bin") exec-path))
(setq exec-path (cons (expand-file-name "/usr/local/bin") exec-path))

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))


(require 'jabber-autoloads)

;; These are the proxy settings for FC
;;(setq url-using-proxy t)
;;(setq url-proxy-services '(("http" . "<USER>:<PASS>@bne-proxy.au.fcl.internal:3128")))



(require 'projectile)

(load (expand-file-name "~/quicklisp/slime-helper.el"))
;; Replace "sbcl" with the path to your implementation
(setq inferior-lisp-program "sbcl")
