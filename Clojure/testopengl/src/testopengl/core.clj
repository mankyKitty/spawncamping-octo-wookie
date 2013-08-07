(ns testopengl.core
  (:import [java.util Random]
           [org.lwjgl.opengl Display DisplayMode GL11]
           [org.lwjgl.util.glu GLU]))

(defn initDisplay [width, height]
  (Display/setDisplayMode (new DisplayMode width height))
  (Display/setVSyncEnabled true)
  (Display/setTitle "Shader Test")
  (Display/create))

(defn gl3f [x y z]
  (GL11/glVertex3f x y z))

(defn draw []
  (GL11/glLoadIdentity)
  (GL11/glTranslatef 0.0 0.0 -10.0)
  (GL11/glColor3f 0.7 0 1.0)
  (GL11/glBegin GL11/GL_QUADS)
  (gl3f -5.0 3.0 0.0)
  (gl3f 5.0 3.0 0.0)
  (gl3f 5.0 -3.0 0.0)
  (gl3f -5.0 -3.0 0.0)
  (GL11/glEnd))

(defn initGL []
  (initDisplay 600 400)
  (GL11/glViewport 0 0 600 400)
  (GL11/glMatrixMode GL11/GL_PROJECTION)
  (GL11/glLoadIdentity)
  (GLU/gluPerspective 45.0 (float (/ 600 400)) 0.1 100.0)
  (GL11/glMatrixMode GL11/GL_MODELVIEW)
  (GL11/glLoadIdentity)
  (GL11/glShadeModel GL11/GL_SMOOTH)
  (GL11/glClearColor 0 0 0 0)
  (GL11/glClearDepth 1.0)
  (GL11/glEnable GL11/GL_DEPTH_TEST)
  (GL11/glDepthFunc GL11/GL_LEQUAL)
  (GL11/glHint GL11/GL_PERSPECTIVE_CORRECTION_HINT GL11/GL_NICEST))

(defn render []
  (GL11/glClear (bit-or GL11/GL_COLOR_BUFFER_BIT GL11/GL_DEPTH_BUFFER_BIT))
  (draw)
  (Display/update)
  (Display/sync 60))

(defn -main [& args]
  (initGL)
    (loop [close? (Display/isCloseRequested)]
      (if-not close?
        (render)
        (do
          (recur (Display/isCloseRequested)))))
  (Display/destroy))
