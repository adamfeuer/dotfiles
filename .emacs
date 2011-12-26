;; Adam Feuer's .emacs file

(add-to-list 'load-path (expand-file-name "~/.emacs.d"))

(custom-set-variables
  ;; custom-set-variables was added by Custom -- don't edit or cut/paste it!
  ;; Your init file should contain only one such instance.
 '(case-fold-search t)
 '(current-language-environment "ASCII")
 '(global-font-lock-mode t nil (font-lock))
 '(iswitchb-mode nil nil (iswitchb))
 '(query-user-mail-address nil)
 '(transient-mark-mode t)
 '(user-mail-address "adamf@pobox.com"))
(custom-set-faces
  ;; custom-set-faces was added by Custom -- don't edit or cut/paste it!
  ;; Your init file should contain only one such instance.
 )

;;
;; personal settings
;;
;; Are we running XEmacs or Emacs?
(defvar running-xemacs (string-match "XEmacs\\|Lucid" emacs-version))

(server-start)  ; Starts server for (among others) emacsclient

(put 'eval-expression 'disabled nil)
(setq scroll-conservatively 1)
(setq require-final-newline t)     ;; Always end a file with a newline
(setq next-line-add-newlines nil)  ;; Stop at the end of the file, not just add lines

;;; key bindings 
;;;
(global-set-key (kbd "M-#") 'comment-region) ;;;  Bind `comment-region' to C-#
(global-set-key (kbd "M-g") 'goto-line) 
(global-set-key [(control tab)] 'bury-buffer) ;;; Control-tab cycles thru buffers

;;; shift-movement selects regions
;;(require 'pc-select)
;;(pc-selection-mode)

;;; pc edit keys
;;(pc-bindings-mode)

;; Python mode
(setq py-indent-offset 3)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 3)
(setq tab-width 3)

;; Python Hook
(add-hook 'python-mode-hook
          (function (lambda ()
                      (setq indent-tabs-mode nil
                            tab-width 3))))

(setq auto-mode-alist
      (cons '("\\.py$" . python-mode) auto-mode-alist))

(setq interpreter-mode-alist
      (cons '("python" . python-mode)
            interpreter-mode-alist))

(autoload 'python-mode "python-mode" "Python editing mode." t)

(global-set-key [f3] 'buffer-menu)
(global-set-key (kbd "M-p") 'fill-paragraph)

;; some functions
 
(defun insert-time ()
  (interactive)
  (insert (format-time-string "%Y-%m-%d-%R")))

;;; add these lines if you like color-based syntax highlighting
(global-font-lock-mode t)
(setq font-lock-maximum-decoration t)

(custom-set-faces
'(default ((t (:stipple nil
  :background "DarkSlateGrey"
  :foreground "Wheat"
  :inverse-video nil
  :box nil
  :strike-through nil
  :overline nil
  :underline nil
  :slant normal
  :weight normal
  :height 116
  :width normal
  :family "apple-andale mono"))))
'(cursor ((t (:background "Wheat"))))
'(region ((t (:background "Darkslateblue ")))))


(put 'downcase-region 'disabled nil)

(setq ispell-program-name "/opt/local/bin/ispell")


;;(load "~/lib/emacs/haskell-site-file")
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)

(global-set-key "%" 'match-paren)
(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
        (t (self-insert-command (or arg 1)))))

;; auto-complete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)


;; Mac key settings
(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)
