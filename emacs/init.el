(package-initialize)

(require 'package)
;; https://emacs.stackexchange.com/questions/949/using-elpa-in-batch-mode-on-windows-fails
(setq package-check-signature nil)
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(unless (package-installed-p 'use-package)
	(package-refresh-contents)
	(package-install 'use-package))

;; 인코딩 설정
(set-language-environment "Korean")
(set-terminal-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(prefer-coding-system 'utf-8)
(when (and window-system (eq system-type 'darwin))
	(set-selection-coding-system 'utf-8)
	(set-keyboard-coding-system 'utf-8)
	(setq locale-coding-system 'utf-8))

(require 'org-install)
(require 'ob-tangle)

;; (add-to-list 'load-path (expand-file-name "init.d" user-emacs-directory))

(defvar thkim256-config-dir
	(file-name-directory (or load-file-name (buffer-file-name))))

(defun thkim256-load-org (s)
	(org-babel-load-file
	 (expand-file-name (format "init-%s.org" s) thkim256-config-dir)))

(add-hook
 'after-init-hook
 (lambda ()
	 (thkim256-load-org "packages")
	 (thkim256-load-org "private")))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load-file custom-file)
(put 'upcase-region 'disabled nil)
