(ns turnboss.grabbers
  (:require [dommy.template :as template])
  (:use [jayq.core :only [$ append children]]))

(defn grab-field [id]
  (. ($ id) (val)))

(defn ErrorMsg [txt]
  ;; Basic Error Message Alert Template
  (dommy.template/node
   [:div {:classes ["alert" "alert-block" "alert-error" "fade-in"]}
    [:button.close {:type "button"
                    :data-dismiss "alert"} "x"]
    [:h4.alert-heading "Oh bother!"]
    [:p (str txt)]]))

(defn display-error [loc msg]
  (let [e ($ loc)]
    (when (empty? (. e (html)))
      (. e append (template/node (ErrorMsg msg))))))

(defn field-empty? [id]
  (empty? (. ($ id) (val))))

(defn grab-player []
  (if (not (field-empty? "#player-name"))
      {:name (grab-field "#player-name") :role (grab-field "#player-role")}))

(defn grab-npc []
  (if (not (field-empty? "#npc-name"))
    {:name (grab-field "#npc-name")
     :role (grab-field "#npc-role")
     :type (grab-field "#npc-type")
     :count (grab-field "#npc-count")}
    (display-error ".player-error-box" "NPC Name cannot be empty!")))
