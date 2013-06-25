(ns turnboss.models.players
  (:use [hiccup.core :only [html]]
        [hiccup.def :only [defhtml]]
        [turnboss.components.extras :as extras]))

(def player-fields [{:label "Player Name"
                     :id "player-name"
                     :inputs [:input {:id "player-name"
                                      :autofocus "autofocus"
                                      :placeholder "Enter Player name here..."}]}
                     {:label "Role"
                      :id "player-role"
                      :inputs (extras/role-selector "player-role")}])

(defn new-player-form-footer []
  [:div
   [:a {:href "#"
        :id "add-player"
        :class "btn btn-primary"} "Add Player"]])

(defhtml player-form-builder []
  (map extras/form-elem-with-controls player-fields))

(defn add-player-form []
  (extras/modal-form "new-player-form"
                     "Add Player"
                     (player-form-builder)
                     (extras/modal-form-footer "add-player" "Add Player")))
