(ns turnboss.core
  (:require [turnboss.grabbers :as grab]
            [turnboss.roster :as roster])
  (:use [jayq.core :only [$ prevent bind document-ready html]]))

;; Reminder for jQuery selectors
;; ($ :.selector) <-- is the object
;;
;; Bind like this:
;; (bind (selector obj) :EVENT func)

(defn clear-form [fm-id]
  (-> (.getElementById js/document fm-id)
      (.log js/console)
      (modal "hide")
      (find "input")) (val ""))

(defn add-player-btn-clicked [e]
  (prevent e)
  (if (not (grab/field-empty? "#player-name"))

    (roster/add-item (roster/RosterEntry "player" (grab/grab-player)))
    (clear-form "#new-player-form")
    (grab/display-error ".player-error-box" "Player name cannot be empty!")))

(defn npc-type-is-not-single? [id]
  (or (= id "multiple-npcs")
      (= id "mob")))

(defn npc-type-selected [e]
  (let [elem-id (.-id (.-currentTarget e))
        elem ($ ".npc-count")]
    (when (npc-type-is-not-single? elem-id)
      (. elem (show)))
    (when (= elem-id "single-npc")
      (. elem (hide)))))

(defn page-ready-actions []
  (. ($ "#roster") (sortable))
  (. ($ ".npc-count") (hide))
  (bind ($ "#add-player") :click add-player-btn-clicked)
  (bind ($ ".npc-type") :change npc-type-selected))

;; Setup our base functionality.
;; This area is for triggering jQuery-UI hooks and other related items
;; that need to be setup for the general running of the page. Like
;; draggable lists, tab'd areas and things like that. We hit them
;; first so everything keeps ticking. So do it fuckin' right.
(document-ready page-ready-actions)