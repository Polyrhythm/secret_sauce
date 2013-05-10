(load "~/.emacs.d/crs_buffers")
(load "~/.emacs.d/frame")
(load "~/.emacs.d/closest_make")
(load "~/.emacs.d/autopair")

(global-set-key [(control \,)] 'comment-region)
(global-set-key [(control \.)] 'uncomment-region)
(global-set-key [(control l)] 'goto-line)
(global-set-key [(control -)] 'undo)

(global-set-key (kbd "C-s-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "C-s-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "C-s-<down>") 'shrink-window)
(global-set-key (kbd "C-s-<up>") 'enlarge-window)

(global-set-key (kbd "M-s-<left>") 'windmove-left)
(global-set-key (kbd "M-s-<right>") 'windmove-right)
(global-set-key (kbd "M-s-<down>") 'windmove-down)
(global-set-key (kbd "M-s-<up>") 'windmove-up)

(global-set-key (kbd "M-<up>") 'backward-sentence)
(global-set-key (kbd "M-<down>") 'forward-sentence)

(global-set-key (kbd "<f5>") 'revert-buffer)

(global-set-key (kbd "C-x C-q") 'query-replace)


; remove undo on several key
(global-unset-key (kbd "C-/"))
(global-unset-key (kbd "C-_"))
(global-unset-key (kbd "C--"))
(global-unset-key (kbd "s-z"))
(global-unset-key (kbd "C-x u"))
(global-unset-key (kbd "C-x C-x"))

(when (display-graphic-p)
 (global-unset-key (kbd "C-x C-c"))
)

;; Put autocomplete on C-/
(global-set-key (kbd "C-/") 'dabbrev-expand)

; remove minimize window on C-x C-z
(global-unset-key (kbd "C-x C-z"))

; move C-l to C-x l
(global-set-key (kbd "C-x l") 'recenter-top-bottom)


;; CRS BUFFER THAT REMOVE *MESSAGE*, *SCRATCH* and *Completions* when hiting C-tab

(global-set-key [(control tab)] 'crs-bury-buffer)
(global-set-key [(control shift tab)] (lambda ()
                                        (interactive)
                                        (crs-bury-buffer -1)))

(add-to-list 'crs-hated-buffers "*Messages*")
(add-to-list 'crs-hated-buffers "*scratch*")
(add-to-list 'crs-hated-buffers "*Completions*")
(add-to-list 'crs-hated-buffers "*compilation*")


(remove-hook 'text-mode-hook 'turn-on-auto-fill)

;; Launch besport

(defun launch_besport ()
  (interactive)
  (browse-url "http://www.besport.com")
)


(defun launch_sid ()
  (interactive)
  (browse-url "http://sid.besport.com")
)


(defun launch_localhost ()
  (interactive)
  (browse-url "http://localhost:8080")
)


;=================
;------INIT-------
;=================

; Do not display line on several line
(set-default 'truncate-lines t)

(when (display-graphic-p)
  ; Load theme
  (load-theme 'misterioso t)

  ; Set window size
  (set-frame-position (selected-frame) 5 0)

  (defun set-frame-size-according-to-resolution ()
  (interactive)
  (progn
    ;; Make the frame the size of the screen
    (add-to-list 'default-frame-alist
                 (cons 'height (/ (- (x-display-pixel-height) 60)
                                  (frame-char-height))))
    (add-to-list 'default-frame-alist
                 (cons 'width (/ (- (x-display-pixel-width) 30)
                                 (frame-char-width))))))

  (set-frame-size-according-to-resolution)
)
;; enable autopair-global-mode (for parentheses)
(autopair-global-mode)
