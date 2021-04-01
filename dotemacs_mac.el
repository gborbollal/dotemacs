(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-default nil)
 '(delete-old-versions t)
 '(make-backup-files nil)
 '(package-selected-packages
   '(winring zygospore burly use-package frog-jump-buffer web-mode zel helm-dired-recent-dirs duplicate-thing move-text robe helm-ag inf-ruby company base16-theme fzf magit ##))
 '(savehist-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

(require 'zel)
(require 'bind-key)
(load-theme 'base16-phd t)
(add-hook 'prog-mode-hook 'company-mode)

(global-set-key (kbd "s-}") (lambda () (interactive) (other-window 1)))
(global-set-key (kbd "s-{") (lambda () (interactive) (other-window -1)))
(global-set-key (kbd "s-S") 'helm-do-ag-project-root)
(global-set-key (kbd "s-o") 'fzf-git)
(global-set-key (kbd "s-w") (lambda () (interactive) (kill-buffer (current-buffer))))
(global-set-key (kbd "s-p") 'find-file)
(global-set-key (kbd "s-9") 'magit-status)
(bind-key* "<M-tab>" 'helm-buffers-list)
(global-set-key (kbd "M-<up>") 'move-text-up)
(global-set-key (kbd "M-<down>") 'move-text-down)
(global-set-key (kbd "s-d") 'duplicate-thing)
(global-set-key (kbd "s-e") 'zel-find-file-frecent)
(global-set-key (kbd "s-s") 'save-buffer)
(global-set-key (kbd "s-e") 'eval-last-sexp)

(global-set-key (kbd "<s-up>") 'buf-move-up)
(global-set-key (kbd "<s-left>") 'buf-move-left)
(global-set-key (kbd "<s-right>") 'buf-move-right)
(global-set-key (kbd "<s-down>") 'buf-move-down)

(global-set-key (kbd "s-1") 'zygospore-toggle-delete-other-windows)
(require 'winring)
(setq winring-keymap-prefix (kbd "s-2"))
(winring-initialize)

(global-set-key (kbd "s-3") 'burly-open-bookmark)

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
