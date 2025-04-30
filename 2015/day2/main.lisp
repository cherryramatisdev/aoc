(ql:quickload :str)

(defpackage day2
  (:use common-lisp))

(in-package #:day2) 

(defun calculate-area (len width height)
  "Calculate the area of the box: 2*l*w + 2*w*h + 2*h*l"
  (declare (type integer len)
           (type integer width)
           (type integer height))
  (+ (* 2 len width) (* 2 width height) (* 2 len height)))

(defun solve-part-1 ()
  (let* ((file-content (uiop:read-file-string "day2/input.txt"))
         (trimmed-content (str:trim file-content))
         (entries (str:words trimmed-content))
         (calculate-area (lambda (prev cur)
                           (let* ((values (str:split "x" cur))
                                  (len (parse-integer (car values)))
                                  (width (parse-integer (car (cdr values))))
                                  (height (parse-integer (car (cdr (cdr values)))))
                                  (slack (min (* len width) (* width height) (* height len))))
                             (+ prev (calculate-area len width height) slack)))))
    (reduce calculate-area entries :initial-value 0)))

(defun solve-part-2 ()
  (let* ((file-content (uiop:read-file-string "day2/input.txt"))
         (trimmed-content (str:trim file-content))
         (entries (str:words trimmed-content))
         (calculate-area (lambda (prev cur)
                           (let* ((values (str:split "x" cur))
                                  (len (parse-integer (car values)))
                                  (width (parse-integer (car (cdr values))))
                                  (height (parse-integer (car (cdr (cdr values)))))
                                  (ribbon (* 2 (min (+ len width) (+ width height) (+ height len))))
                                  (bow (* len width height)))
                             (+ prev ribbon bow)))))
    (reduce calculate-area entries :initial-value 0)))

(solve-part-1)
(solve-part-2)
