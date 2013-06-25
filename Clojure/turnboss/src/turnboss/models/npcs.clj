(ns turnboss.models.npcs
  (:use [hiccup.def :only [defhtml]]
        [hiccup.form :only [drop-down radio-button]]
        [turnboss.components.extras :as extras]))

(def npc-types ["Single NPC" "Mob" "Multiple NPCs"])

(def npc-fields [{:label "Name/Label"
                  :id "npc-name"
                  :inputs [:input {:id "npc-name"
                                   :autofocus "autofocus"
                                   :placeholder "Enter NPC name here..."}]}
                 {:label "Role"
                  :id "npc-role"
                  :inputs (extras/role-selector "npc-role")}
                 {:label "Type"
                  :id "npc-type"
                  :inputs (map extras/radio-with-controls npc-types)}
                 {:label "Count"
                  :id "npc-count"
                  :inputs [:input {:id "npc-count"
                                   :class "input-mini"
                                   :placeholder "1 .. 10"}]}])

(defhtml npc-form-builder []
  (map extras/form-elem-with-controls npc-fields))

(defn add-npcs-form []
  (extras/modal-form "new-npc-form"
                     "Add NPC"
                     (npc-form-builder)
                     (extras/modal-form-footer "add-npc" "Add NPC")))