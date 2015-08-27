(require 'package)
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;; Thesaurus Synonym finder
(require 'thesaurus)
(thesaurus-set-bhl-api-key-from-file "~/Dropbox/thesaurus-api-key")

;; Column numbers/line numbers
(setq column-number-mode t)
(global-linum-mode 1)
(setq linum-format "%4d ")

;; Set Default directory to Home
(setq default-directory (getenv "HOME"))

;; Autocomplete stuff.
(require 'auto-complete)
(require 'go-autocomplete)
(require 'auto-complete-config)
(ac-config-default)
(global-auto-complete-mode t)
(auto-complete-mode t)

(require 'smartparens-config)
(smartparens-global-mode +1)
(show-smartparens-global-mode +1)
(setq sp-autoescape-string-quote nil)

;;; Smex & ido
(autoload 'smex "smex")
(global-set-key (kbd "M-x") 'smex)
(ido-mode t)
(setq ido-enable-flex-matching t)

;; Multi-cursor mode
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C-.") 'mc/mark-next-like-this)
(global-set-key (kbd "C-,") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-,") 'mc/mark-all-like-this)

;; Quick String replace
(global-set-key (kbd "C-x C-r") 'replace-string)

;; Quick String replace
(global-set-key (kbd "C-x C-a") 'align-regexp)

;; Get rid of yes/no and just use y/n
(defalias 'yes-or-no-p 'y-or-n-p)

;; Disable OS window shit
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

;; Projectile functionality
(projectile-global-mode)
;; Projectile ignores gitignore directory.
(setq projectile-use-native-indexing t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-file-name-transforms (quote ((".*" "~/.emacs.d/autosaves/\\1" t))))
 '(backup-directory-alist (quote ((".*" . "~/.emacs.d/backups/"))))
 '(coffee-tab-width 2)
 '(custom-safe-themes (quote ("96998f6f11ef9f551b427b8853d947a7857ea5a578c75aa9c4e7c73fe04d10b4" "d06640625bb1d92f29bb226863715fe5609264db807a1c465f55a368f5f97541" "3632cf223c62cb7da121be0ed641a2243f7ec0130178722554e613c9ab3131de" "7b4d9b8a6ada8e24ac9eecd057093b0572d7008dbd912328231d0cada776065a" "3f78849e36a0a457ad71c1bda01001e3e197fe1837cb6eaa829eb37f0a4bdad5" "66132890ee1f884b4f8e901f0c61c5ed078809626a547dbefbb201f900d03fd8" "f04122bbc305a202967fa1838e20ff741455307c2ae80a26035fbf5d637e325f" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "05c3bc4eb1219953a4f182e10de1f7466d28987f48d647c01f1f0037ff35ab9a" "3a884171a5fe0da762df0a852c8f825faa564b5041f4dab74c33797b15b11499" "159b754a1fb5b20d43499cdb5ef13936cedfbaabf9d70f65377a5df61ddc409f" "64581032564feda2b5f2cf389018b4b9906d98293d84d84142d90d7986032d33" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "e16a771a13a202ee6e276d06098bc77f008b73bbac4d526f160faa2d76c1dd0e" "a3d519ee30c0aa4b45a277ae41c4fa1ae80e52f04098a2654979b1ab859ab0bf" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Set theme
(load-theme 'zerodark t)
(powerline-default-theme)

;; set transparency
(set-frame-parameter (selected-frame) 'alpha '(85 85))
(add-to-list 'default-frame-alist '(alpha 85 85))

;; Enable unicode in term
(add-hook 'term-exec-hook
          (function
           (lambda ()
             (set-buffer-process-coding-system 'utf-8-unix 'utf-8-unix))))

;; Unbind Pesky Sleep Button
(global-unset-key [(control z)])
(global-unset-key [(control x)(control z)])

;; Make backspace on selected region bahave like a member of the 21st century
(delete-selection-mode 1)

;; Custom indentation options
(setq-default indent-tabs-mode nil)

(add-hook 'html-mode-hook
          (lambda()
            (setq sgml-basic-offset 4)))

(add-hook 'less-css-mode-hook
          (lambda()
            (setq css-indent-offset 4)))



(add-hook 'go-mode-hook  (lambda() (setq c-basic-offset 2)))
(add-to-list 'ac-modes 'go-mode)
(add-hook 'before-save-hook 'gofmt-before-save)
(add-hook 'go-mode-hook (lambda ()
                          (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)))
(load "/Users/dave/go_path/src/code.google.com/p/go.tools/cmd/oracle/oracle.el")
(add-hook 'go-mode-hook 'go-oracle-mode)

(add-hook 'after-change-major-mode-hook
          '(lambda ()
             (setq-default indent-tabs-mode nil)))

(add-hook 'js-mode-hook 'js2-minor-mode)
(add-hook 'js2-mode-hook 'ac-js2-mode)

;; Mac-specific fixes
(if (eq system-type 'darwin)
    (progn
      (setq mac-option-modifier 'super) ;; Keyboard
      (setq mac-command-modifier 'meta)
      (setq ring-bell-function #'ignore) ;; kinetic scroll fix
      (when (memq window-system '(mac ns))
        (exec-path-from-shell-initialize))
      )
  )

;; Hooks
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(global-set-key (kbd "C-<") 'shrink-window-horizontally)
(global-set-key (kbd "C->") 'enlarge-window-horizontally)

;; Put autosave files (ie #foo#) and backup files (ie foo~) in ~/.emacs.d/.


;; create the autosave dir if necessary, since emacs won't.
(make-directory "~/.emacs.d/autosaves/" t)

;; emacs newbie protection overrides
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
