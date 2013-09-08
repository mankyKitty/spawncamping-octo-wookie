(ns modern_cljs.shopping
  (:require [domina :as dom]
            [domina.events :as ev]))

(defn add-help []
  (dom/append! (dom/by-id "shoppingForm")
               "<div class='help'>Click to calculate</div>"))

(defn calculate []
  (let [quantity (dom/value (dom/by-id "quantity"))
        price (dom/value (dom/by-id "price"))
        tax (dom/value (dom/by-id "tax"))
        discount (dom/value (dom/by-id "discount"))]
    (dom/set-value! (dom/by-id "total") (-> (* quantity price)
                                    (* (+ 1 (/ tax 100)))
                                    (- discount)
                                    (.toFixed 2)))
    false))

(defn ^:export init []
  (if (and js/document
           (.-getElementById js/document))
    (ev/listen! (dom/by-id "calc") :click calculate)
    (ev/listen! (dom/by-id "calc") :mouseover add-help)))
