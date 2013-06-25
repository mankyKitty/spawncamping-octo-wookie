(defproject rounder "0.1.0-SNAPSHOT"
  :description "Clojure & ClojureScript App"
  :url "http://bestoffive.com"
  :dependencies [[org.clojure/clojure "1.5.1"]
                 [compojure "1.1.5"]
                 [domina "1.0.0"]
                 [org.clojure/google-closure-library-third-party "0.0-2029"]]
  :plugins [[lein-ring "0.8.5"]
            [lein-cljsbuild "0.3.2"]]
  :ring {:handler rounder.handler/app}
  :profiles
  {:dev {:dependencies [[ring-mock "0.1.5"]]}}
  :cljsbuild {:builds
              [{;; CLJS Source Path
                :source-paths ["src/cljs"]
                ;; Google Closure Compiler Ops
                :compiler {;; CLS Generated Filename
                           :output-to "resources/public/js/rounder.js"
                           ;; Minimmal JS optimisations directive
                           :optimizations :whitespace
                           ;; generated JS Core prettyfication
                           :pretty-print true}}]})
