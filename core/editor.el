;;----------------~-------------------~-----------------------
;;               Cedet Semantic symref tool
;;--------------~--------------------~------------------------
(require 'cc-mode)
(require 'semantic)
(semantic-mode 1)	;; enabled features will depend on semantic-mode 1

(setq cedet-global-command "global")

(global-semanticdb-minor-mode 1)	;; enables global support for semanticdb
(global-semantic-mru-bookmark-mode 1)
(global-semantic-highlight-func-mode 1)
(global-semantic-stickyfunc-mode 1)
(global-semantic-decoration-mode 1)
(global-semantic-idle-scheduler-mode 1)
(global-semantic-idle-local-symbol-highlight-mode 1)
(global-semantic-idle-completions-mode 1)
(global-semantic-idle-summary-mode 1)
(global-semantic-show-unmatched-syntax-mode 1)
(global-semantic-show-parser-state-mode 1)
(global-semantic-highlight-edits-mode 1)

;;To enable more advanced functionality for name completion, etc.,
;;you can load the semantic/ia with following command:
(require 'semantic/ia)

;;If you're using GCC for programming in C & C++, then Semantic can automatically find directory,
;;where system include files are stored.
(require 'semantic/bovine/gcc)

;;System header files
(semantic-add-system-include "/usr/include" 'c-mode)

;; Customization of Semanticdb
;; if you wnat to enable support for gnu global
;;(when (cedet-gnu-global-version-check t)) ;; is not active
(semanticdb-enable-gnu-global-databases 'c-mode t)
(semanticdb-enable-gnu-global-databases 'c++-mode t)

;;--------------~--------------------~------------------------
;;                     Ecb environment
;;--------------~--------------------~------------------------
(require 'ecb)
(ecb-activate)

;; ecb compile window frame
(setq ecb-show-sources-in-directories-buffer 'always)
(setq ecb-compile-window-height 12)

;;--------------~--------------------~------------------------
;;                    Code environment
;;--------------~--------------------~------------------------
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(add-hook 'c-mode-common-hook 'hs-minor-mode)

;; source folding
(global-set-key (kbd "C-b") 'hs-hide-block)
(global-set-key (kbd "C-s") 'hs-show-block)

;; smart tab behavior - indent or complete
(setq tab-always-indent 'complete)

;; gdb windows option.
(setq gdb-many-windows t)

;;--------------~--------------------~------------------------
;;                  Edit environment
;;--------------~--------------------~------------------------
(require 'multiple-cursors)
(global-set-key (kbd "C-l") 'mc/edit-lines)
(global-set-key (kbd "C-;") 'mc/mark-all-words-like-this)

;;--------------~--------------------~------------------------
;;                 helm-gtags environment
;;--------------~--------------------~------------------------
(require 'helm-config)
(require 'helm-gtags)

;; Enable helm-gtags-mode
(add-hook 'c-mode-hook 'helm-gtags-mode)
(add-hook 'c++-mode-hook 'helm-gtags-mode)
(add-hook 'asm-mode-hook 'helm-gtags-mode)

;; helm gtags customize
(setq helm-gtags-path-style 'relative)
(setq helm-gtags-ignore-case t)
(setq helm-gtags-auto-update t)

;;--------------~--------------------~------------------------
;;                 Smartparens environment
;;--------------~--------------------~------------------------
;; smart pairing for all
(require 'smartparens-config)
(setq sp-base-key-bindings 'paredit)
(setq sp-autoskip-closing-pair 'always)
(setq sp-hybrid-kill-entire-symbol nil)
(sp-use-paredit-bindings)

(show-smartparens-global-mode +1) 

;; disable annoying blink-matching-paren
(setq blink-matching-paren nil)

;;--------------~--------------------~------------------------
;;                   Coding style
;;--------------~--------------------~------------------------
;;;; linux-c-mode setting
;;;; linux kernel c style and mode
;;;; under line fix path for your linux kernel directory.
(defun linux-c-mode ()
  "C mode with adjusted defaults for use with the Linux kernel."
  (interactive)
  (c-mode)
  (c-set-style "K&R")
  (setq tab-width 8)
  (setq indent-tabs-mode t)
  (setq c-basic-offset 8)) 

;;;; python-mode
(add-hook 'python-mode-hook
          (function (lambda ()
                      (setq indent-tabs-mode t)
                      (setq tab-width 4)
                      (setq python-indent 4))))

;; file property auto-mode-alist
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'auto-mode-alist '("\\.c\\'" . linux-c-mode))

;;--------------~--------------------~------------------------
;;                 Coding encoding
;;--------------~--------------------~------------------------
;;; default coding system setting
(prefer-coding-system 'utf-8)
(setq coding-system-for-read 'utf-8)
(setq coding-system-for-write 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;;; coding system read file
(modify-coding-system-alist 'file "\\.c\\'" 'utf-8)
(modify-coding-system-alist 'file "\\.py\\'" 'utf-8)
(modify-coding-system-alist 'file "\\.S\\'" 'utf-8)
(modify-coding-system-alist 'file "\\.h\\'" 'utf-8)
(modify-coding-system-alist 'file "\\.txt\\'" 'utf-8)
(modify-coding-system-alist 'file "\\.cpp\\'" 'utf-8)
(modify-coding-system-alist 'file "\\.txt\\'" 'utf-8)

;;--------------~--------------------~------------------------
;;          Autocomplete default environment
;;--------------~--------------------~------------------------
;; Auto-complete default true.
(require 'auto-complete)
(global-auto-complete-mode t)

;;--------------~--------------------~------------------------
;;                Editor defun function
;;--------------~--------------------~------------------------
;;; toggle fullscreen
;;; http://www.emacswiki.org/emacs/FullScreen
(defun toggle-fullscreen ()
  "Toggle full screen on X11"
  (interactive)
  (when (eq window-system 'x)
    (set-frame-parameter
     nil 'fullscreen
     (when (not (frame-parameter nil 'fullscreen)) 'fullboth))))
(global-set-key [f11] 'toggle-fullscreen)

;;--------------~--------------------~------------------------
;;                   Warning disable
;;--------------~--------------------~------------------------
(setq large-file-warning-threshold nil)
(provide 'editor)
