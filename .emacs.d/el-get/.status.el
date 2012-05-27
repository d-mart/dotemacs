((TeXMed status "removed" recipe nil)
 (ack status "installed" recipe
      (:name ack :type http :localname "ack.el" :url "http://repo.or.cz/w/ShellArchive.git?a=blob_plain;hb=HEAD;f=ack.el" :shallow nil :description "Use ack where you might usually use grep." :features ack))
 (apel status "installed" recipe
       (:name apel :website "http://www.kanji.zinbun.kyoto-u.ac.jp/~tomo/elisp/APEL/" :description "APEL (A Portable Emacs Library) is a library to support to write portable Emacs Lisp programs." :type cvs :module "apel" :url ":pserver:anonymous@cvs.m17n.org:/cvs/root" :build
              (mapcar
               (lambda
                 (target)
                 (list el-get-emacs
                       (split-string "-batch -q -no-site-file -l APEL-MK -f")
                       target "prefix" "site-lisp" "site-lisp"))
               '("compile-apel" "install-apel"))
              :load-path
              ("site-lisp/apel" "site-lisp/emu")))
 (auto-indent-mode status "installed" recipe
                   (:name auto-indent-mode :website "https://github.com/mlf176f2/auto-indent-mode.el" :description "Automatically Indent  when pressing return, pasting, and other customizable features." :type github :pkgname "mlf176f2/auto-indent-mode.el"))
 (auto-pair+ status "installed" recipe
             (:name auto-pair+ :type emacswiki :website "http://www.emacswiki.org/emacs/auto-pair%2b.el"))
 (autopair status "installed" recipe
           (:name autopair :website "http://code.google.com/p/autopair/" :description "Autopair is an extension to the Emacs text editor that automatically pairs braces and quotes." :type http :url "http://autopair.googlecode.com/svn/trunk/autopair.el" :features autopair))
 (buff-menu+ status "installed" recipe
             (:name buff-menu+ :type emacswiki :website "http://www.emacswiki.org/emacs/buff-menu%2b.el"))
 (clojure-mode status "installed" recipe
               (:name clojure-mode :website "https://github.com/technomancy/clojure-mode" :description "Emacs support for the Clojure language." :type github :pkgname "technomancy/clojure-mode"))
 (color-theme status "installed" recipe
              (:name color-theme :description "An Emacs-Lisp package with more than 50 color themes for your use. For questions about color-theme" :website "http://www.nongnu.org/color-theme/" :type http-tar :options
                     ("xzf")
                     :url "http://download.savannah.gnu.org/releases/color-theme/color-theme-6.6.0.tar.gz" :load "color-theme.el" :features "color-theme" :post-init
                     (progn
                       (color-theme-initialize)
                       (setq color-theme-is-global t))))
 (color-theme-zenburn status "installed" recipe
                      (:name color-theme-zenburn :type emacsmirror :pkgname "zenburn-theme" :description "Just some alien fruit salad to keep you in the zone" :prepare
                             (progn
                               (autoload 'color-theme-zenburn "zenburn" "Just some alien fruit salad to keep you in the zone." t)
                               (defalias 'zenburn #'color-theme-zenburn))))
 (dired+ status "installed" recipe
         (:name dired+ :description "Extensions to Dired" :type emacswiki :features dired+))
 (emacs-goodies-el status "removed" recipe nil)
 (emacs-http-server status "installed" recipe
                    (:name emacs-http-server :description "A rudimentary HTTP server in elisp." :type github :pkgname "jrhbailey/emacs-http-server"))
 (grep-edit status "installed" recipe
            (:name grep-edit :type emacswiki :website "http://www.emacswiki.org/emacs/grep-edit.el"))
 (magit status "installed" recipe
        (:name magit :website "https://github.com/magit/magit#readme" :description "It's Magit! An Emacs mode for Git." :type github :pkgname "magit/magit" :info "." :build
               ("make all")
               :build/darwin
               `(,(concat "PATH="
                          (shell-quote-argument invocation-directory)
                          ":$PATH make all"))))
 (misc-cmds status "installed" recipe
            (:name misc-cmds :type emacswiki :website "http://www.emacswiki.org/emacs/misc-cmds.el"))
 (yaml-mode status "installed" recipe
            (:name yaml-mode :description "Simple major mode to edit YAML file for emacs" :type github :pkgname "yoshiki/yaml-mode" :prepare
                   (progn
                     (autoload 'yaml-mode "yaml-mode" nil t)
                     (add-to-list 'auto-mode-alist
                                  '("\\.ya?ml\\'" . yaml-mode))))))
