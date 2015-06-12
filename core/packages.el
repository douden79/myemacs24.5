;;-----------------------~------------------------~---------------------
;;; knuth-packages.el --- Emacs knuth : default package selection.
;;----------------------~-------------------------~---------------------
(require 'cl)
(require 'package)

;;---------------~------------------~----------------------~-----------
;; emacs package archives
;;-------------------------~-------------------------~-----------------
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t) ; Org-mode's repository

;; set package-user-dir to be relative to Knuth install path
(setq package-user-dir (expand-file-name "melpa" knuth-dir))
(package-initialize)

;;-----------------~-----------------~--------------------------------
;; Package List
;;----------------------~---------------------~-----------------------
(defvar knuth-packages
  '( ecb
     cedet
     multiple-cursors
     monokai-theme
     magit
     helm-gtags
     smartparens
     highlight-symbol
     auto-complete
    )
  "A list of packages to ensure are installed at launch.")

;;; requirement elpy packages.
;; sudo apt-get install pip
(defun knuth-packages-installed-p ()
  "Check if all packages in `knuth-packages' are installed."
  (every #'package-installed-p knuth-packages))

(defun knuth-require-package (package)
  "Install PACKAGE unless already installed."
  (unless (memq package knuth-packages)
    (add-to-list 'knuth-packages package))
  (unless (package-installed-p package)
    (package-install package)))

(defun knuth-require-packages (packages)
  "Ensure PACKAGES are installed.
Missing packages are installed automatically."
  (mapc #'knuth-require-package packages))

(define-obsolete-function-alias 'knuth-ensure-module-deps 'knuth-require-packages)

(defun knuth-install-packages ()
  "Install all packages listed in `knuth-packages'."
  (unless (knuth-packages-installed-p)
    ;; check for new packages (package versions)
    (message "%s" "Emacs Knuth is now refreshing its package database...")
    (package-refresh-contents)
    (message "%s" " done.")
    ;; install the missing packages
    (knuth-require-packages knuth-packages)))

;; run package installation
(knuth-install-packages)

(defun knuth-list-foreign-packages ()
  "Browse third-party packages not bundled with Knuth.

Behaves similarly to `package-list-packages', but shows only the packages that
are installed and are not in `knuth-packages'.  Useful for
removing unwanted packages."
  (interactive)
  (package-show-package-list
   (set-difference package-activated-list knuth-packages)))

(provide 'packages)
;; Local Variables:
;; byte-compile-warnings: (not cl-functions)
;; End:

;;; knuth-packages.el ends here
