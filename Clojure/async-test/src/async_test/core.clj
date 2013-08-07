(ns async-test.core
  (:use [clojure.tools.cli :only (cli)])
  (:require [clojure.core.async :refer :all]
            [clojure.string :as string])
  (:gen-class))

(defn parse-args [args]
  (cli args ["-f" "--file" "Specify the full path to gowalla file" :default false
             "-dl" "--delimiter" "Specify the delimiter for each line. Defaults to \\t" :default "\t"]))

(defn process-by-line [file]
  "Retrieve the file as a lazy sequence of individual lines"
  (line-seq (clojure.java.io/reader file)))

(defn parse-for-list [in]
  (map #(string/split % #"\t") in))

(defn -main [& args]
  (let [[options args banner] (parse-args args)]
    (if  (not (:file options))
      (do
        (println banner)
        (System/exit 1))
      (parse-for-list (process-by-line (:file options))))))

; (defn -main [& args]
;   (doseq [i (range 10)]
;      (go
;        (Thread/sleep (rand-int 1000))
;        (println i)))
;   (Thread/sleep 2000))

; (defn -main [& args]
;   (let [c (chan)]
;     (doseq [i (range 10)]
;       (go
;         (Thread/sleep (rand-int 1000))
;         (>! c i)))
;     (<!!
;       (go
;         (doseq [_ (range 10)]
;           (println (<! c)))))))

;; (defn -main []
;;   (let [c (chan) b (chan)]
;;     (go
;;       (Thread/sleep (rand-int 1000))
;;       (>! c "success!"))

;;     (<!!
;;       (go
;;         (let [[result source] (alts! [c (timeout 500)])]
;;           (if (= source c)
;;             (println "Got a value!")
;;             (println "Timeout!")))))))