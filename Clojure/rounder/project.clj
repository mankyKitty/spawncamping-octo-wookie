(defproject rounder "0.1.0-SNAPSHOT"
  :description "Rounder: Turn and Player management for any turn based game."
  :url "http://rounder.bestoffive.com"
  :dependencies [[org.clojure/clojure "1.5.1"]
                 [compojure "1.1.5"]
                 [prismatic/dommy "0.1.1"]]
  :plugins [[lein-ring "0.8.5"]
            [lein-cljsbuild "0.3.2"]]
  :ring {:handler rounder.handler/app}
  :profiles
  {:dev {:dependencies [[ring-mock "0.1.5"]]}}
  :jvm-opts []
  :cljs-build {
               :builds [{
                         :source-path ["src-cljs"]
                         :compiler {
                                    :output-to "resources/public/js/main.js"
                                    :optimizations :whitespace
                                    :pretty-print true}}]})
