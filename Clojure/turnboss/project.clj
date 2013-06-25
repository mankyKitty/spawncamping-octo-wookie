(defproject turnboss "0.1.0-SNAPSHOT"
  :description "FIXME: write description"
  :url "http://example.com/FIXME"
  :dependencies [[org.clojure/clojure "1.5.1"]
                 [compojure "1.1.1"]
                 [jayq "2.0.0"]
                 [hiccup "1.0.2"]
                 [prismatic/dommy "0.0.2"]]
  :plugins [[lein-ring "0.7.1"]
            [lein-cljsbuild "0.2.10"]]
  :cljsbuild
  {:builds
   [{:source-paths ["src-cljs"],
     :compiler
     {:pretty-print true,
      :output-to "resources/public/js/main.js"
      :optimizations :simple}}]}
  :ring {:handler turnboss.handler/app}
  :dev-dependencies [[ring-mock "0.1.2"]]
  :hooks [leiningen.cljsbuild])
