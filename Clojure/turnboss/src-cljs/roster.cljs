(ns turnboss.roster
  (:require [dommy.template :as tmp])
  (:use [jayq.core :only [$ children append each fade-in]]))

(defn roster-item-icon [type data]
  [:i.icon-fire {:height "64px" :width "64px"}])

(defn RosterEntry [type data]
  ;; Single player item for use in the roster
  (tmp/node
   [:li {:classes ["roster-item" "media" type]}
    [:div.pull-left
     (roster-item-icon type data)]
    [:div.media-body
     [:h4 {:classes ["media-heading" "player-name"]} (data :name)]
     [:div.role (data :role)]]]))

(defn prepare-roster []
  (when (not (empty? ($ ".empty-roster-item")))
    (. ($ "#roster li") (remove))))

(defn add-item [item]
  ;; Add this item to the player roster
  (prepare-roster)
  ;; Make sure we're not adding the same player name twice.
  (-> ($ "#roster")
      (append item)
      (fade-in)))