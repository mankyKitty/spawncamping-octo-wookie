(ns othello.core
  (:gen-class))

(def moves {:up         (fn [s max] (+ s max))
            :down       (fn [s max] (- s max))
            :left       (fn [s max] (- s 1))
            :right      (fn [s max] (+ s 1))
            :up-left    (fn [s max] (+ s (- max 1)))
            :up-right   (fn [s max] (+ s (+ max 1)))
            :down-left  (fn [s max] (- s (- max 1)))
            :down-right (fn [s max] (- s (+ max 1)))})

(defn calc-move [sq max fun]
  (when (> ((fun moves) sq max) 0)
    (list fun ((fun moves sq max)))))

(defn get-moves [sq max]
  (map #(calc-move sq max %) (keys moves)))

(defn -main
  "I don't do a whole lot ... yet."
  [& args]
  ;; work around dangerous default behaviour in Clojure
  (alter-var-root #'*read-eval* (constantly false))
  (println "Hello, World!"))
