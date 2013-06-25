(defproject nodehello "0.1.0-SNAPSHOT"
  :description "FIXME: write description"
  :url "http://example.com/FIXME"
  :license {:name "Eclipse Public License"
            :url "http://www.eclipse.org/legal/epl-v10.html"}
  :dependencies [[org.clojure/clojure "1.5.0"]
                 [hiccup "1.0.2"]]
  :plugins [[lein-cljsbuild "0.3.0"]]
  :cljsbuild { :builds [{ 
                         :source-paths ["src/nodehello"] 
                         :compiler { :output-to "src/js/nodehello.js"
                                     :target :nodejs
                                     :optimizations :simple
                                     :pretty-print true }}]})
