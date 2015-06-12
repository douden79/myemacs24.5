;;----------------~-------------------~-----------------------
;;                Global Keybindings on emacs
;;----------------~-------------------~-----------------------


;;----------------~-------------------~-----------------------
;;                     ECB Keybindings
;;----------------~-------------------~-----------------------
(require 'ecb)
;; custom-set-variables for ecb frame
(define-key ecb-mode-map (kbd "M-1") 'ecb-goto-window-directories)
(define-key ecb-mode-map (kbd "M-2") 'ecb-goto-window-sources)
(define-key ecb-mode-map (kbd "M-3") 'ecb-goto-window-methods)
(define-key ecb-mode-map (kbd "M-4") 'ecb-goto-window-history)
(define-key ecb-mode-map (kbd "M-5") 'ecb-goto-window-compilation)
(define-key ecb-mode-map (kbd "M-0") 'ecb-goto-window-edit1)

;;----------------~-------------------~-----------------------
;;                    Moving emacs windows
;;----------------~-------------------~-----------------------
(global-set-key [M-left] 'windmove-left)
(global-set-key [M-right] 'windmove-right)
(global-set-key [M-up] 'windmove-up)
(global-set-key [M-down] 'windmove-down)

;;--------------~--------------------~------------------------
;;                  Magit and git environment
;;--------------~--------------------~------------------------
;; TODO : magit add, commit, puth function implement
(global-set-key (kbd "C-x s") 'magit-status)
(global-set-key (kbd "C-x l") 'magit-log)

;;--------------~--------------------~------------------------
;;                  Helm Gtags keymapping
;;--------------~--------------------~------------------------
;; key bindings
(add-hook 'helm-gtags-mode-hook
          '(lambda ()
             (local-set-key (kbd "M-t") 'helm-gtags-pop-stack)
             (local-set-key (kbd "M-]") 'helm-gtags-find-tag)
             (local-set-key (kbd "M-[") 'helm-gtags-find-rtag)
             (local-set-key (kbd "M-.") 'helm-gtags-dwim)
             (local-set-key (kbd "M-,") 'helm-gtags-tags-in-this-function)
             (local-set-key (kbd "C-j") 'helm-gtags-select)
             (local-set-key (kbd "M-g M-p") 'helm-gtags-parse-file)))

;;--------------~--------------------~------------------------
;;                 HighLight Symbol
;;--------------~--------------------~------------------------
;; highlight at point
(require 'highlight-symbol)
(global-set-key [f3] 'highlight-symbol-at-point)
(global-set-key [f4] 'highlight-symbol-next) 
(global-set-key [f2] 'highlight-symbol-prev) 

(provide 'keybindings)
