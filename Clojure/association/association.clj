(def ts [[:Mango, :Onion, :Nintendo, :Key-chain, :Eggs, :Yo-yo]
         [:Doll, :Onion, :Nintendo, :Key-chain, :Eggs, :Yo-yo]
         [:Mango, :Apple, :Key-chain, :Eggs]
         [:Mango, :Umbrella, :Corn, :Key-chain, :Yo-yo]
         [:Corn, :Onion, :Onion, :Key-chain, :Ice-cream, :Eggs]])

(def tally (frequencies (flatten ts)))

tally

(def tally-items (filter (fn [x]
                           (let [[k v] x]
                             (>= v 3)))
                         tally))

tally-items

(loop [[k & r] (map first tally-items)
       acc []]
  (if (seq r)
    (recur r (conj acc (map #(vector k %) r)))
    acc))
