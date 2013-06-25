(defproject tb "0.1.0-SNAPSHOT"
  :description "Turn Boss - cljs"
  :url "http://turnboss.awesome.sauce"
  :license {:name "Eclipse Public License"
            :url "http://www.eclipse.org/legal/epl-v10.html"}
  :dependencies [[org.clojure/clojure "1.5.0"]
                 [enlive "1.1.1"]]
  :plugins [[lein-cljsbuild "0.3.0"]]
  :cljsbuild { :builds [{ 
                         :source-paths ["src/tb"] 
                         :compiler { :output-to "src/js/tb.js"
                                     :target :nodejs
                                     :optimizations :simple
                                     :pretty-print true }}]})