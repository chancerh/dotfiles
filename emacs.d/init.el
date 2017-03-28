;; Autoinstall from http://stackoverflow.com/questions/10092322/how-to-automatically-install-emacs-packages-by-specifying-a-list-of-package-name

; list the packages you want
(setq package-list '(auto-complete company elpy find-file-in-project highlight-indentation markdown-mode popup pyvenv yasnippet))

; list the repositories containing them
(setq package-archives '(("elpa" . "http://tromey.com/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")))

; activate all the packages (in particular autoloads)
(package-initialize)

; fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))



;; MELPA
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/")))
(package-initialize)

;; elpy
(package-initialize)
(elpy-enable)
(setq python-check-command "flake8")
(elpy-use-ipython)
(setq python-shell-interpreter "ipython" python-shell-interpreter-args "--simple-prompt --pprint")

;; Mouse for iterm2
(require 'mouse)
(xterm-mouse-mode t)
(defun track-mouse (e))
(setq mouse-sel-mode t)

;; Swap Backspace and Del keys
(keyboard-translate ?\C-h ?\C-?)

;; Zenburn theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'zenburn t)

;; autocomplete
(require 'auto-complete-config)
(ac-config-default)

;; ess configuration
(setq ess-eval-visibly nil) ; ESS will not print the evaluated commands, also speeds up the evaluation 
(setq ess-use-auto-complete t)
(setq  ess-tab-complete-in-script t)
(setq ess-use-auto-complete 'script-only) ; autocomplete
; reassign assignment key
(setq ess-smart-S-assign-key ";")
(ess-toggle-S-assign nil)
(ess-toggle-S-assign nil)

