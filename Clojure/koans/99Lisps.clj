(ns mylisps.core)

;; Get the last value in the list
(def foo '(a b c d))
(def bar '(a a a a b c c a a d e e e e))

(defn my-last [x]
  (last x))

(my-last foo)

;; Get the last two in the list
(defn my-but-last [x]
  (reverse (take 2 (reverse x))))

(my-but-last foo)

;; Get the Nth element of a list
(defn element-at [n x]
  (when (and (not (empty? x)) (> n 0))
    (nth x (- n 1))))

(element-at 3 foo)

;; Find the number of elements in a list
(defn k-elements [x]
  (count x))

(k-elements foo)

;; Reverse a list
(defn reverse-my-list [x]
  (reverse x))

(reverse-my-list foo)

(defn compress [x]
  (map first (partition-by identity x)))

(compress bar)

(def palid '(x a m a x))

(defn palindrome? [a]
  (= a (reverse a)))

(palindrome? palid)

(def lis '(a (b (c d) e)))

;; Flatten :\
(flatten lis)
;; Kinda sorta something
(apply cons (map identity lis))

;; Encode and Decode the list
(def ls '(a a a a b c c a a d e e e e))

(defn encode-list [a]
  (map #(cons (count %) (list (first %))) (partition-by identity a)))

(def ls2 (encode-list ls))

(defn decode-list [a]
  (map #(take (first %) (repeat (last %))) a))

(decode-list ls2)

;; Duplicate items
(defn duplic [x]
  (flatten (map #(repeat 2 %) x)))

(defn repli [lis n]
  (flatten (map #(repeat n %) lis)))

;; Drop Every N'th Element from a list
(def ls '(a b c d e f g h i k))

(defn drop-last [x]
  (reverse (drop 1 (reverse x))))

(defn drop-at [coll n]
  (flatten (map #(drop-last %) (partition n coll))))

;; Splice Problem
(defn splicen [coll n]
  (list (take n coll) (drop n coll)))

;; Extract a slice from a list
(defn slicey [coll a b]
  (take (- b a) (drop (- a 1) coll)))

;; Rotate List to the LEFT by N places.
(def ls '(a b c d e f g h i j k))

(defn splicen [coll n]
  (list (take n coll) (drop n coll)))

(defn rotate [coll n]
  (if (> n 0)
    (flatten (reverse (splicen coll n)))
    (let [x (- (count coll) (* -1 n))]
      (flatten (list (drop x coll) (take x coll))))))

(rotate ls 3)
(rotate ls -2)

;; Remove Kth element from the list
(defn remove-at [coll k]
  (flatten (cons (take (- k 1) x) (drop k x))))

;; Insert Element at K'th position in a list
(defn insert-at [ins coll x]
  (let [x (partition (- x 1) coll)]
    (flatten (cons (first x) (cons ins (rest x))))))


;; Produce range between start and end
;; yes I know range can produce the results I really wanted.
(defn produce-range [start end]
  (filter #(and (>= % start) (<= % end)) (range end)))

(defn range-between [a b]
  (if (> a b)
    (produce-range b a)
    (produce-range a b)))
