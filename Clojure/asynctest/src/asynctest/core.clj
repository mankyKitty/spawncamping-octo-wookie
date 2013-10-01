(ns asynctest.core
  (:require [clojure.core.async :refer :all])
  (:gen-class))

(defn first-example []
  (doseq [i (range 10)]
    (go
     (Thread/sleep (rand-int 1000))
     (println i)))
  (Thread/sleep 2000))

(defn second-example []
  (let [c (chan)]
    (doseq [i (range 10)]
      (go
       (Thread/sleep (rand-int 1000))
       (>! c i)))
    (<!!
     (go
      (doseq [_ (range 10)]
        (println (<! c)))))))

(defn third-example []
  (let [c (chan)]
    (go
     (Thread/sleep (rand-int 1000))
     (>! c "success!"))
    (<!!
     (go
      (let [[result source] (alts! [c (timeout 500)])]
        (if (= source c)
          (println "Got a value!")
          (println "timeout!")))))))

(defn -main [& args]
  (do
    (first-example)
    (second-example)
    (third-example))
