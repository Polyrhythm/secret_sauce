(add-to-list 'load-path "~/.emacs.d")

; If you use Sym-Lock, you could also add some customization code after the
;; `(require 'sym-lock)' in your `.emacs'

(if (featurep 'sym-lock)
    (setq tuareg-sym-lock-keywords
	  '(("<-" 0 1 172 nil) ("->" 0 1 174 nil)
	    (":=" 0 1 220 nil)
	    ("<=" 0 1 163 nil) (">=" 0 1 179 nil)
	    ("<>" 0 1 185 nil) ("==" 0 1 186 nil)
	    ("||" 0 1 218 nil) ("&&" 0 1 217 nil)
	    ("[^*]\\(\\*\\ nil)\\." 1 8 180 nil)
	    ("\\(/\\ nil)\\." 1 3 184 nil)
	    (":>" 0 1 202 nil)
	    (";;" 0 1 191 nil)
	    ("\\<_\\>" 0 3 188 nil) ("\\<sqrt\\>" 0 3 214 nil)
	    ("\\<unit\\>" 0 3 198 nil) ("\\<fun\\>" 0 3 108 nil)
	    ("\\<or\\>" 0 3 218 nil) ("\\<not\\>" 0 3 216 nil))))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(c-basic-indent 2)
 '(column-number-mode t)
 '(css-indent-offset 2)
 '(custom-safe-themes (quote ("1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" default)))
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(js3-auto-indent-p t)
 '(js3-enter-indents-newline t)
 '(js3-indent-on-enter-key t)
 '(line-number-mode t)
 '(nxhtml-autoload-web nil t)
 '(standard-indent 2)
 '(tab-width 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;selection et suppression si on ecrit du texte
(progn
(delete-selection-mode 1)
  (transient-mark-mode 1)
)

(when (display-graphic-p)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
)

(menu-bar-mode t)

;; Taille et position par defaut de la fenetre
;; (if window-system
;;     (setq initial-frame-alist '((top . 00)(left . 00)(width . 100)(height . 100))))


(fset 'yes-or-no-p 'y-or-n-p)
(setq make-backup-files nil)
;;couleur
;; (set-background-color "DarkSlateGray")
;; (set-foreground-color "Wheat")
;; (set-cursor-color "Orchid")

;;bell
;; (setq visible-bell 'top-bottom)


;;coloration
(global-font-lock-mode t)
;;les parenthese associé
(require 'paren)
(show-paren-mode)

(desktop-load-default)
(desktop-read)

(setq default-major-mode 'indented-text-mode)
(setq text-mode-hook 'turn-on-auto-fill)
(setq fill-column 72)

;;racourci clavier
(global-set-key [f2] 'save-buffer)
(global-set-key [f3] 'find-file)
(global-set-key [f4] 'kill-this-buffer)
(global-set-key [f9] 'compile)
(global-set-key [(control c)(control c)] 'compile)
(global-set-key [(control z)] 'undo)
(global-set-key [(control q)] 'kill-ring-region)


;; ;;Fermeture de parenthèse, crochet et guillements automatiques...
;; (defun insert-parentheses () "insert parentheses and go between them" (interactive)
;;   (insert "()")
;;   (backward-char 1))
;; (defun insert-brackets () "insert brackets and go between them" (interactive)
;;   (insert "[]")
;;   (backward-char 1))
;; (defun insert-braces () "insert curly braces and go between them" (interactive)
;;   (insert "{}")
;;   (backward-char 1))
;; (defun insert-quotes () "insert quotes and go between them" (interactive)
;;   (insert "\"\"")
;;   (backward-char 1))
;; (global-set-key "(" 'insert-parentheses) ;;inserts "()"
;; (global-set-key "[" 'insert-brackets)
;; (global-set-key "{" 'insert-braces)
;; (global-set-key "\"" 'insert-quotes)

;; (set-default-font "7x13")

(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)



;;CAML

(add-to-list 'auto-mode-alist '("\\.ml[iylp]?" . tuareg-mode))
(autoload 'tuareg-mode "tuareg" "Major mode for editing Caml code" t)
(autoload 'camldebug "camldebug" "Run the Caml debugger" t)
(dolist (ext '(".cmo" ".cmx" ".cma" ".cmxa" ".cmi"))
  (add-to-list 'completion-ignored-extensions ext))

(add-hook
 'tuareg-mode-hook
 '(lambda ()
    (setq tuareg-lazy-= t)
					; indent `=' like a standard keyword
    (setq tuareg-lazy-paren t)
					; indent [({ like standard keywords
    (setq tuareg-in-indent 0)

    (setq show-trailing-whitespace t)
    (setq-default indicate-empty-lines t)
    (add-hook 'before-save-hook 'delete-trailing-whitespace)
					; no indentation after `in' keywords
    ;; (auto-fill-mode 1)
					; turn on auto-fill minor mode
    (if (featurep 'sym-lock)   ; Sym-Lock customization only
        (setq sym-lock-mouse-face-enabled nil))
					; turn off special face under mouse
    ))



(add-to-list 'auto-mode-alist '("[.]css$" . css-mode))
(add-to-list 'auto-mode-alist '("[.]scss$" . css-mode))
(add-to-list 'auto-mode-alist '("[.]sass$" . css-mode))

(load "~/.emacs.d/perso")
(add-to-list 'custom-theme-load-path "~/.emacs.d/emacs-color-theme-solarized")
(load-theme 'solarized-light t)
(load-file "~/.emacs.d/haml-mode.el")

(load-file "~/.emacs.d/js3-mode/js3.elc")
(add-to-list 'auto-mode-alist '("\\.js$" . js3-mode))

(add-to-list 'load-path "~/.emacs.d/vendor/coffee-mode")
(require 'coffee-mode)
(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))

(add-to-list 'load-path (expand-file-name "~/.emacs.d/scss-mode"))
(autoload 'scss-mode "scss-mode")
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))

(setq exec-path (cons (expand-file-name "~/Users/ryan/.rvm/gems/ruby-1.9.3-p392/bin") exec-path))

(defun my-scss-mode-hook ()
  "Hooks for SASS mode."
  (setq-default scss-compile-at-save nil)
  ;; (setq-default scss-output-directory "/dev/shm")
  ;; (flymake-mode-on)
)
(add-hook 'scss-mode-hook 'my-scss-mode-hook)

(add-to-list 'load-path "~/.emacs.d/multi-web-mode")
(require 'multi-web-mode)
(setq mweb-default-major-mode 'html-mode)
(setq mweb-tags '((php-mode "<\\?php\\|<\\? \\|<\\?=" "\\?>")
                  (js-mode "<script +\\(type=\"text/javascript\"\\|language=\"javascript\"\\)[^>]*>" "</script>")
                  (css-mode "<style +type=\"text/css\"[^>]*>" "</style>")))
(setq mweb-filename-extensions '("php" "htm" "html" "ctp" "phtml" "php4" "php5"))
(multi-web-global-mode 1)

(add-to-list 'load-path "~/.emacs.d/vendor/jade-mode")
(require 'sws-mode)
(require 'jade-mode)    
(add-to-list 'auto-mode-alist '("\\.styl$" . sass-mode))
(add-to-list 'auto-mode-alist '("\\.jade$" . jade-mode))
(add-to-list 'auto-mode-alist '("\\.blade$" . jade-mode))

(add-to-list 'load-path "~/.emacs.d/tramp/lisp/")
(require 'tramp)
(setq tramp-default-method "ssh")

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

(add-to-list 'load-path "~/.emacs.d/sass-mode")
(require 'sass-mode)
