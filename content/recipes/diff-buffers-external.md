+++
title = "Diff two buffers/ranges with external diff tool in Emacs"
lastmod = 2023-01-20T18:57:42+01:00
rtags = ["emacs"]
draft = false
creator = "Emacs 28.2 (Org mode 9.6 + ox-hugo)"
+++

This function is based on built-in `ediff` in Emacs. I noticed that in some
complex situations [meld](https://meldmerge.org/) gives better results so here is a function based on
`ediff-buffers` that let user choose two buffers and then run `meld` on the
selection. Note that buffers must be saved to files for this to work, and of
course meld must be installed.

```emacs-lisp
(defun diff-buffers-external (buffer-A buffer-B)
  "Based on ediff-buffers. Run meld on a pair of buffers, BUFFER-A and BUFFER-B."
  (interactive
   (let (bf)
     (list (setq bf (read-buffer "Buffer A to compare: "
                 (ediff-other-buffer "") t))
       (read-buffer "Buffer B to compare: "
            (progn
              ;; realign buffers so that two visible bufs will be
              ;; at the top
              (save-window-excursion (other-window 1))
              (ediff-other-buffer bf))
            t))))
  (call-process "meld" nil 0 nil
                (buffer-file-name (get-buffer buffer-A))
                (buffer-file-name (get-buffer buffer-B))))
```

And here is a function that diffs two ranges in two buffers. It will create
temporary buffers, save them to temporary files and call meld. First, two
buffers are selected and then a range starting from current location (you can
select the same buffer twice). Then, in each buffer a region is selected and
confirmed with `C-M-c`.

```emacs-lisp
(defun diff-regions-external (buffer-A buffer-B)
  "Based on ediff-regions-linewise. Run meld on a pair of regions in specified buffers.
BUFFER-A and BUFFER-B are the buffers to be compared.
Regions (i.e., point and mark) can be set in advance or marked
interactively."
  (interactive
   (let (bf)
     (list (setq bf (read-buffer "Region A's buffer: "
                 (ediff-other-buffer "") t))
       (read-buffer "Region B's buffer: "
            (progn
              ;; realign buffers so that two visible bufs will be
              ;; at the top
              (save-window-excursion (other-window 1))
              (ediff-other-buffer bf))
            t))))
  (if (not (ediff-buffer-live-p buffer-A))
      (user-error "Buffer %S doesn't exist" buffer-A))
  (if (not (ediff-buffer-live-p buffer-B))
      (user-error "Buffer %S doesn't exist" buffer-B))


  (let ((buffer-A
         (ediff-clone-buffer-for-region-comparison buffer-A "-Region.A-"))
    (buffer-B
         (ediff-clone-buffer-for-region-comparison buffer-B "-Region.B-"))
        reg-A-beg reg-A-end reg-B-beg reg-B-end)
    (with-current-buffer buffer-A
      (setq reg-A-beg (region-beginning)
        reg-A-end (region-end))
      (write-region reg-A-beg reg-A-end "/tmp/meld-left")
      (kill-buffer buffer-A)
      (set-buffer buffer-B)
      (setq reg-B-beg (region-beginning)
        reg-B-end (region-end))
      (write-region reg-B-beg reg-B-end "/tmp/meld-right")
      (kill-buffer buffer-B))

  (call-process "meld" nil 0 nil "/tmp/meld-left" "/tmp/meld-right")))
```
