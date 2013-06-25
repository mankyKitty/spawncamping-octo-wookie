(ns turnboss.handler
  (:use [compojure.core :only [defroutes GET POST]])
  (:require [compojure.handler :as handler]
            [compojure.route :as route]
            [turnboss.models.players :as players]
            [turnboss.views.layouts :as layouts]))

(defroutes app-routes
  (GET "/" [] (layouts/main-page))
  (GET "/add-player-form" [] (players/add-player-form))
  (POST "/add-player" [player]
        (players/add-player-submitted player))
  (route/resources "/")
  (route/not-found (layouts/four-oh-four)))

(def app
  (handler/site app-routes))
