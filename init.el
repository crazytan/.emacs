(package-initialize)

;; hide toolbar
(tool-bar-mode -1)

;; hide scroll bar
(scroll-bar-mode -1)

;; map command to meta
(if (eq system-type 'darwin)
    (progn
      (setq mac-option-key-is-meta nil)
      (setq mac-command-key-is-meta t)
      (setq mac-command-modifier 'meta)
      (setq mac-option-modifier nil)))

;; line and column number
(global-linum-mode t)
(setq line-number-mode t)
(setq column-number-mode t)

;; battery status
(if (eq system-type 'darwin)
    (display-battery-mode 1))

;; init window size
(add-to-list 'default-frame-alist '(height . 45))
(add-to-list 'default-frame-alist '(width . 100))

;; MELPA
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

;; store all backup and autosave files in the tmp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; y-or-n instead of yes-or-no
(defalias 'yes-or-no-p 'y-or-n-p)

;; add texbin to PATH and exec-path
(if (eq system-type 'darwin)
    (progn
      (setenv "PATH" (concat (getenv "PATH") ":/Library/TeX/texbin"))
      (setq exec-path (append exec-path '("/Library/TeX/texbin")))))

;; show matching parenthesis
(show-paren-mode 1)

;; disable tab for indent
(setq-default indent-tabs-mode nil)

;; move between windows
(global-set-key (kbd "M-]") 'other-window)
(global-set-key (kbd "M-[") 'prev-window)

(defun prev-window ()
  (interactive)
  (other-window -1))

;; tramp
(setq tramp-default-method "ssh")

;; material theme
(load-theme 'material t)

;; rainbow identifier mode
(add-hook 'prog-mode-hook 'rainbow-identifiers-mode)

;; ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; smooth scrolling
(require 'smooth-scrolling)
(smooth-scrolling-mode 1)
