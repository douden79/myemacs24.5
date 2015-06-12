;;-------------------~-----------------------~------------------------
;;; knuth-ui.el --- Emacs Prelude: UI optimizations and tweaks.
;;-------------------~-----------------------~------------------------
;; the toolbar is just a waste of valuable screen estate
;; in a tty tool-bar-mode does not properly auto-load, and is

;; already disabled anyway
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(menu-bar-mode -1)
;; the blinking cursor is nothing, but an annoyance
(blink-cursor-mode -1)
;; disable startup screen
(setq inhibit-startup-screen t)
;; nice scrolling
(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)
;;; linumber default true.
(global-linum-mode 1)

;; mode line settings
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)
;; make the fringe (gutter) smaller
;; the argument is a width in pixels (the default is 8)
(if (fboundp 'fringe-mode)
    (fringe-mode 4))

(scroll-bar-mode -1)

;; enable y/n answers
(fset 'yes-or-no-p 'y-or-n-p)
;; more useful frame title, that show either a file or a
;; buffer name (if the buffer isn't visiting a file)
(setq frame-title-format
      '("" invocation-name " Knuth - " (:eval (if (buffer-file-name)
                                                  (abbreviate-file-name (buffer-file-name))
                                                "%b"))))
;; use zenburn as the default theme
(load-theme 'monokai t)

(provide 'ui)
;;; knuth-ui.el ends here
