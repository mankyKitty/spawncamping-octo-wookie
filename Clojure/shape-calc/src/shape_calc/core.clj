(ns shape-calc.core
  (:use [clojure.tools.cli :only [cli]])
  (:gen-class))

(defn rect [w h]
  (* w h))

(defn square [s]
  (* s s))

(defn triangle [b h]
  (* (/ 1 2) b h))

(defn -main
  "I don't do a whole lot ... yet."
  [& args]
  ;; work around dangerous default behaviour in Clojure
  (alter-var-root #'*read-eval* (constantly false))
  (println "Hello, World!"))
