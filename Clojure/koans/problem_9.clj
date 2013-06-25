(ns problem_9.core)

(def testList "aaaabbccaaddeeee")

(defn compress [x]
  (map first (partition-by identity x)))