(ns nodehello.core
  (:require [cljs.nodejs :as node]
            [nodehello.routes :as router]))

(def express
  (node/require "express"))

(def app (express))

(defn index-page [_ res]
  (.send res "Hello World!"))

(def routes [
             {:path "/" :handler index-page}])

(defn -start [& args]
  (doto app

    ; Start our logging service
    (.use (. express (logger)))

    ; Setup our base route
    (.get "/" index-page)
    
    ; Start our server
    (.listen 3000))
  
  (println (str "Express server started on port: 3000")))

(set! *main-cli-fn* -start)
