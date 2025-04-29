(defun solve-part-1 ()
  (let* ((file-content (uiop:read-file-string "input.txt"))
         (trim-content (string-trim '(#\Newline #\space) file-content))
         (calculate-parens (lambda (prev-paren cur-paren)
                             (ccase cur-paren
                                    (#\) (- prev-paren 1))
                                    (#\( (+ prev-paren 1))))))
    (reduce 
      calculate-parens 
      (coerce trim-content 'list) 
      :initial-value 0)))

(defun find-paren-index (acc index list)
  (if (= acc -1)
    (list index acc)
    (ccase (nth index list)
           (#\) (find-paren-index (- acc 1) (+ index 1) list))
           (#\( (find-paren-index (+ acc 1) (+ index 1) list)))))

(defun solve-part-2 ()
  (let* ((file-content (uiop:read-file-string "input.txt"))
         (trim-content (string-trim '(#\Newline #\space) file-content)))
    (car (find-paren-index 0 0 (coerce trim-content 'list)))))

(solve-part-2)
(solve-part-1)
