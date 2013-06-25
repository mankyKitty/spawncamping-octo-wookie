(ns tb.core
  (:require [cljs.nodejs :as node]))

(def express (node/require "express"))

(def app (express))

(defn build-path [path]
  (apply str (js* "__dirname") path))

(defn index-page [_ res]
  (.render res "index" (js-obj "title" "Turn Boss")))

(defn -start [& args]
  (doto app
    (.use (. express (logger)))
    ;; Jaaaaaaaaaaadddeeeeeee
    (.set "view engine" "jade")
    ;; rocks
    (.set "views" (build-path "/public/views"))
    ;; All our indexes will be defined here so I
    ;; either need to keep the number of pages tiny
    ;; or workout a sexier way of building my routes
    (.get "/" index-page)
    ;; Lets roll bitches
    (.listen 3000))
  (println (str "Server Started on Port: 3000")))

(set! *main-cli-fn* -start)