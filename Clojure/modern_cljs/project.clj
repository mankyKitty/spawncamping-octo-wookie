(defproject modern_cljs "0.1.0-SNAPSHOT"
  :description "FIXME: write description"
  :url "http://example.com/FIXME"
  :license {:name "Eclipse Public License"
            :url "http://www.eclipse.org/legal/epl-v10.html"}
  ;; Clojure Source Code Path
  :source-paths ["src/clj"]
  :dependencies [[org.clojure/clojure "1.5.1"]]
  ;; lein-cljsbuild plugin to build a CLJS project
  :plugins [[lein-cljsbuild "0.3.2"]]

  ;; Cljsbuild options and configuration
  :cljsbuild {:builds
              [{;;CLJS Source Code Path
                :source-paths ["src/cljs"]
                ;; Google Closure (CLS) options configuration
                :compiler {;; CLS generated JS script filename
                           :output-to "resources/public/js/modern.js"
                           ;; Minimal JS optimisations
                           :optimizations :whitespace
                           ;; generated JS code prettyfication
                           :pretty-print true}}]})
