(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-default nil)
 '(cider-lein-command "~/bin/lein")
 '(cider-show-error-buffer nil)
 '(delete-old-versions t)
 '(display-time-mode t)
 '(make-backup-files nil)
 '(package-check-signature nil)
 '(package-selected-packages
   (quote
    (helm-projectile helm-ag-r helm-ag color-theme-modern markdown-preview-eww markdown-mode docker-compose-mode dockerfile-mode docker flx-ido neotree cider magit fzf base16-theme company robe move-text duplicate-thing helm zel web-mode frog-jump-buffer use-package burly zygospore zfz winring)))
 '(ring-bell-function (quote ignore))
 '(savehist-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Linux Libertine Mono O" :foundry "PfEd" :slant normal :weight normal :height 98 :width normal)))))
(require 'zel)
(require 'bind-key)
(add-hook 'prog-mode-hook 'company-mode)
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
;; (load-theme 'base16-phd t)

;;(load-theme 'emacs-21 t t)
;;(enable-theme 'emacs-21)

(bind-key* "M-}" (lambda () (interactive) (other-window 1)))
(bind-key* "M-{" (lambda () (interactive) (other-window -1)))
(global-set-key (kbd "M-S") 'helm-do-ag-project-root)
(global-set-key (kbd "M-o") 'helm-projectile-ag)
(global-set-key (kbd "C-p") (lambda () (interactive) (kill-buffer (current-buffer))))
(global-set-key (kbd "M-p") 'find-file)
(global-set-key (kbd "M-9") 'magit-status)
(bind-key* "C-<tab>" 'helm-buffers-list)
(bind-key* "C-z" 'undo)
(global-set-key (kbd "M-<down>") 'move-text-down)
(global-set-key (kbd "M-<up>") 'move-text-up)
(global-set-key (kbd "C-d") 'duplicate-thing)
;; (global-set-key (kbd "M-e") 'zel-find-file-frecent)
(global-set-key (kbd "M-s") 'save-buffer)
(global-set-key (kbd "M-e") 'eval-last-sexp)

(global-set-key (kbd "<C-M-left>") 'buf-move-left)
(global-set-key (kbd "<C-M-right>") 'buf-move-right)
(global-set-key (kbd "<C-M-up>") 'buf-move-up)
(global-set-key (kbd "<C-M-down>") 'buf-move-down)
(bind-key* "M-x" 'helm-M-x)

(global-set-key (kbd "M-1") 'zygospore-toggle-delete-other-windows)
(require 'winring)
(setq winring-keymap-prefix (kbd "M-2"))
(winring-initialize)

;; (global-set-key (kbd "M-3") 'burly-open-bookmark)
(global-set-key (kbd "M-3") 'neotree-toggle)

(add-to-list 'load-path "~/.emacs.d/vendors/emacs-powerline")
(add-to-list 'load-path "~/.emacs.d/vendors/buffer-move")
(require 'powerline)
(require 'buffer-move)

(set-face-attribute 'mode-line nil
                    :foreground "Black"
                    :background "DarkOrange"
                    :box nil)

(add-hook 'ruby-mode-hook 'robe-mode)
(eval-after-load 'company
  '(push 'company-robe company-backends))

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
