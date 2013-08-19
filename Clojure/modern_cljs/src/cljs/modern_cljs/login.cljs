(ns modern_cljs.login
  (:use [domina :only [by-id value]]))

;; define the function to be attached to form submission event
(defn validate-form []
  ;; get email and password element from their ids in the HTML form
  (let [email (by-id "email")
        pass (by-id "password")]
    (if (and (> (count (value email)) 0)
             (> (count (value pass)) 0))
      true
      (do (js/alert "Please, complete the form!")
          false))))

;; define the function to attach validate-form to onsubmit event of
;; the form
(defn ^:export init []
  ;; verify that js/document exists and that is had a getElementById
  ;; property
  (if (and js/document
           (.-getElementById js/document))
    ;; get loginForm by element id and set its onsubmit property to
    ;; our validate-form function
    (let [login-form (.getElementById js/document "loginForm")]
      (set! (.-onsubmit login-form) validate-form))))
