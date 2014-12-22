(require 'package)
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;; Thesaurus Synonym finder
(require 'thesaurus)
(thesaurus-set-bhl-api-key-from-file "~/Dropbox/thesaurus-api-key")

;; Show column number in info bar thing
(setq column-number-mode t)

;; Set Default directory to Home
(setq default-directory (getenv "HOME"))

;; Autocomplete stuff.
(require 'auto-complete)
(require 'go-autocomplete)
(require 'auto-complete-config)
(ac-config-default)

(require 'smartparens-config)
(smartparens-global-mode +1)
(show-smartparens-global-mode +1)
(setq sp-autoescape-string-quote nil)

;;; Smex & ido
(autoload 'smex "smex")
(global-set-key (kbd "M-x") 'smex)
(ido-mode t)

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
 '(custom-safe-themes (quote ("159b754a1fb5b20d43499cdb5ef13936cedfbaabf9d70f65377a5df61ddc409f" "64581032564feda2b5f2cf389018b4b9906d98293d84d84142d90d7986032d33" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "e16a771a13a202ee6e276d06098bc77f008b73bbac4d526f160faa2d76c1dd0e" "a3d519ee30c0aa4b45a277ae41c4fa1ae80e52f04098a2654979b1ab859ab0bf" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Set theme
(load-theme 'monokai t)
(powerline-nano-theme)

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

;; Default directory
(cd "~")

;; Mac-specific fixes
(if (eq system-type 'darwin)
    (progn
      (setq mac-option-modifier 'super) ;; Keyboard
      (setq mac-command-modifier 'meta)
      (setq ring-bell-function #'ignore) ;; kinetic scroll fix
      )
  )

;; Hooks
(add-hook 'before-save-hook 'delete-trailing-whitespace)
