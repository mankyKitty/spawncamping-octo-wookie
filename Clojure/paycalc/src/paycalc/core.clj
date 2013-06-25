(ns paycalc.core
  (:use [[clj-time]]))

(defn calculate-pay [hours rate]
  (* hours rate))

(defn gief-date-obj [hour min]
  ;; Provide a joda Datetime object using current
  ;; day and the provided hour and minute
  (date-time (year (now))
             (month (now))
             (day (now))
             hour
             min))

(defn less-lunch-time [hours lunch]
  ;; Deduct our predetermined time for lunch
  (- hours lunch))


(defn hours-worked [s-hour s-min f-hour f-min]
  ;; Calculate the total hours worked using provided
  ;; start and end times
  (/ (in-minutes (interval (gief-date-obj s-hour s-min) 
                           (gief-date-obj f-hour f-min))) 60.0))

(defn calculate-hours [s-hour s-min f-hour f-min lunch]
  ;; Calculate the total hours worked for the day, taking
  ;; the amount of time for lunch into consideration.
  (less-lunch-time (hours-worked s-hour s-min f-hour f-min) lunch))

(def myHours (slurp "/Users/manky/hours.txt")) ;; load our timesheet

(doseq [x (split myHours #"\n")]
  (let [day (into {} (map vector [:start-hour :start-min :finish-hour :finish-min :lunch] (split x #" ")))]
    (println (calculate-pay (calculate-hours (Integer/parseInt (get day :start-hour))
                                             (Integer/parseInt (get day :start-min))
                                             (Integer/parseInt (get day :finish-hour))
                                             (Integer/parseInt (get day :finish-min))
                                             (Integer/parseInt (get day :lunch)))
                            myRate))))

(defn foo
  "I don't do a whole lot."
  [x]
  (println x "Hello, World!"))

(defn -main [& args]
  (doseq [x args]
    (println x)))