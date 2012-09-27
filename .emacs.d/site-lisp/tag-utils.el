;; Utilities for making and working with tags

(defun create-tags (dir-name)
  "Create tags file."
  (interactive "DDirectory: ")
  (message "tagging %s" dir-name)
  (eshell-command
   (format "find %s -type f -name \"*.[ch]\" | etags -R -f %s/TAGS -L - && echo \"TAGS created\"" dir-name dir-name))
  (visit-tags-table dir-name))

(defun create-rtags (dir-name)
  "Create tags file."
  (interactive "DDirectory: ")
  (message "tagging %s" dir-name)
  (eshell-command
   (format "find %s -type f | egrep \"\.(rb|feature)$\" | etags -f %s/TAGS -L - && echo \"OK\"" dir-name dir-name))
  (visit-tags-table dir-name))

;; this version is non-interactive and tags a TAGS file path as an arg
;; This is to make One Giant TAGS file since some tags utils only look
;; at the last tag file loaded 
(defun append-tags-to-tagfile (dir-name tags-file)
  (message "tagging %s to TAGS file %s" dir-name tags-file)
  (eshell-command
   (format "find %s -type f -name \"*.[ch]\" | etags --recurse=yes --append=yes --if0=no -f %s -L - && echo \"TAGS created\"" dir-name tags-file)))

(defun append-rtags-to-tagfile (dir-name tags-file)
  (message "tagging %s to TAGS file %s" dir-name tags-file)
  (eshell-command
   (format "find %s -type f -regextype posix-extended -regex '.*\.(rb|feature|rake)' | etags --recurse=yes --append=yes --if0=no -f %s -L - && echo \"TAGS created\"" dir-name tags-file)))

(defun is-tags-load ()
  (interactive)
  (message "Building intelliSOURCE tags")
  (setq sg-tags-file "~/proj/intelliSOURCE/TAGS")
  (eshell-command
    (format "rm -f %s" sg-tags-file))
  (tags-reset-tags-tables)
  (setq dirs-to-tag '("~/proj/intelliSOURCE"))
  (setq stored-pref tags-add-tables) ; store off current pref for overwriting tags-tables
  (setq tags-add-tables t)         ; set tags-tables to append
  (loop for i in dirs-to-tag do (append-rtags-to-tagfile i sg-tags-file))
  (setq tags-add-tables stored-pref)
  (visit-tags-table sg-tags-file)
  (file-cache-clear-cache)
  (file-cache-add-directory-using-find "~/proj/intelliSOURCE")
  (message "Loaded intelliSOURCE tags"))


(defun imod-tags-load ()
  (interactive)
  (message "Building iMod tags")
  (setq imod-tags-file "~/proj/intelliembed/imod/projects/TAGS")
  (eshell-command
    (format "rm -f %s" imod-tags-file))
  (tags-reset-tags-tables)
  (setq dirs-to-tag '("~/proj/intelliembed/imod/src"
                      "~/proj/intelliembed/common"
                      "~/proj/intelliembed/imod/test"
                      "~/proj/intelliembed/lib/netx"
                      "~/proj/intelliembed/lib/threadx"
                      "~/proj/intelliembed/lib/filex"
                      "~/proj/intelliembed/lib/libstrophe"
                      "~/proj/intelliembed/lib/expat"
                      "~/proj/intelliembed/lib/f1protocol/C_Output"
                      "~/proj/intelliembed/lib/base64"
                      "~/proj/intelliembed/lib/cunit/CUnit"
                      "~/proj/intelliembed/lib/broadcom"
                      "~/proj/intelliembed/lib/protocolbuffers"
                      ))
  (setq stored-pref tags-add-tables) ; store off current pref for overwriting tags-tables
  (setq tags-add-tables t)         ; set tags-tables to append
  (loop for i in dirs-to-tag do (append-tags-to-tagfile i imod-tags-file))
  (setq tags-add-tables stored-pref)
  (visit-tags-table imod-tags-file)
  (message "Loaded iMod tags")
  )

(defun carrier-tags-load ()
  (interactive)
  (message "Building Carrier tags")
  (setq tags-file "~/proj/comfchoice/UI/source/TAGS")
  (eshell-command
    (format "rm -f %s" tags-file))
  (tags-reset-tags-tables)
  (setq dirs-to-tag '("~/proj/comfchoice/UI/source/TAGS"))
  (setq stored-pref tags-add-tables) ; store off current pref for overwriting tags-tables
  (setq tags-add-tables t)         ; set tags-tables to append
  (loop for i in dirs-to-tag do (append-tags-to-tagfile i tags-file))
  (setq tags-add-tables stored-pref)
  (visit-tags-table tags-file)
  (message "Loaded Carrier tags")
  )

(defun proz-tags-load ()
  (interactive)
  (message "Building ProZ tags")
  (tags-reset-tags-tables)
  (setq dirs-to-tag '("~/proj/GAEng/Firmware/CSQ/Common"
                      "~/proj/GAEng/Firmware/CSQ/SSZigbee"
                      ;"~/proj/GAEng/Firmware/CSQ/"
                      ))
  (setq stored-pref tags-add-tables) ; store off current pref for overwriting tags-tables
  (setq tags-add-tables t)         ; set tags-tables to append
  (loop for i in dirs-to-tag do (create-tags i))
  (setq tags-add-tables stored-pref)
  (message "Loaded ProZ tags"))

(defun nextgen-tags-load ()
  (interactive)
  (message "Building NextGen tags")
  (setq tags-file "~/proj/GAEng/Firmware/NextGen/TAGS")
  (eshell-command
   (format "rm -f %s" tags-file))
  (tags-reset-tags-tables)
  (setq dirs-to-tag '("~/proj/GAEng/Firmware/NextGen/Common"
                      "~/proj/GAEng/Firmware/NextGen/Gen3/Code"
                      "~/proj/GAEng/Firmware/NextGen/Gen3/Simulation"
                      "~/proj/GAEng/Firmware/NextGen/Gen3/UnitTest"
                      "~/proj/GAEng/lib/f1protocol/C_Output"
                      ))
 (setq stored-pref tags-add-tables) ; store off current pref for overwriting tags-tables
 (setq tags-add-tables t)         ; set tags-tables to append
 (loop for i in dirs-to-tag do (append-tags-to-tagfile i tags-file))
 (setq tags-add-tables stored-pref)
 (visit-tags-table tags-file)
 (message "Loaded NextGen tags"))

(defun dirty-harry-tags-load ()
  (interactive)
  (message "Building Dirty Harry tags")
  (tags-reset-tags-tables)
  (setq dirs-to-tag '("~/proj/GAEng/Firmware/DirtyHarry/Code"))
  (setq stored-pref tags-add-tables) ; store off current pref for overwriting tags-tables
  (setq tags-add-tables t)         ; set tags-tables to append
  (loop for i in dirs-to-tag do (create-tags i))
  (setq tags-add-tables stored-pref)
  (message "Loaded Dirty Harry tags"))


;; from http://www.vimeo.com/1013263
;; kind of a find-file in project (TAGS) function
(defun ido-find-file-in-tag-files ()
  (interactive)
  (save-excursion
    (let ((enable-recursive-minibuffers t))
      (visit-tags-table-buffer))
    (find-file
     (expand-file-name
      (ido-completing-read "File in project: "
                           (tags-table-files)
                           nil t)))))

(defalias 'ffit 'ido-find-file-in-tag-files)
