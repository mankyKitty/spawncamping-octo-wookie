(use 'clj-time.core)
(use 'clojure.string)

(defn calculate-pay [hours rate]
  (* hours rate))

(calculate-pay 8 52.5)

(defn gief-date-obj [hour min]
  (date-time (year (now))
             (month (now))
             (day (now))
             hour
             min))

(defn less-lunch-time [hours lunch]
  (- hours lunch))

(defn hours-worked [s-hour s-min f-hour f-min]
  (in-hours (interval (gief-date-obj s-hour s-min)
                      (gief-date-obj f-hour f-min))))

(defn calculate-hours [s-hour s-min f-hour f-min lunch]
  (less-lunch-time (hours-worked s-hour s-min f-hour f-min)
     lunch))

(calculate-hours 8 20 17 40 1)

(defn combine-the-things [a b]
  (let [new ()
        x a
        y b]
    (assoc new x y)))

(combine-the-things [1 2 3] [:a :b :c])