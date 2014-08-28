(require 'package)
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;; Graphene because I'm a noob
(require 'graphene)

;; Disable stupid autoescape
(setq sp-autoescape-string-quote nil)

;; Projectile functionality
(projectile-global-mode)
;; Fixes gitignore problems
(setq projectile-use-native-indexing t)

(custom-set-variables

 ;; Whitelist themes
 '(custom-safe-themes (quote
                       (
                        "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4"
                        "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879"
                        "e16a771a13a202ee6e276d06098bc77f008b73bbac4d526f160faa2d76c1dd0e"
                        "a3d519ee30c0aa4b45a277ae41c4fa1ae80e52f04098a2654979b1ab859ab0bf"
                        default
                        )
                       )))
(custom-set-faces)

;; Set theme
(load-theme 'solarized-light t)

;; Unbind Pesky Sleep Button
(global-unset-key [(control z)])
(global-unset-key [(control x)(control z)])

;; Make backspace on selected region bahave likea member of the 21st century
(delete-selection-mode 1)

;; Custom indentation options
(setq-default indent-tabs-mode nil)

(add-hook 'html-mode-hook
          (lambda()
            (setq sgml-basic-offset 4)))

(add-hook 'less-css-mode-hook
          (lambda()
            (setq sgml-basic-offset 4)))

(add-hook 'go-mode-hook
          (lambda()
            (setq c-basic-offset 4)))
(add-hook 'go-mode-hook
          (lambda()
            (add-hook 'after-save-hook 'gofmt)))
(add-hook 'go-mode-hook
          (lambda()
            (add-hook 'go-autocomplete)))

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
