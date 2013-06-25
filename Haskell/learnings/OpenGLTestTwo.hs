import Graphics.Rendering.OpenGL
import Graphics.UI.GLUT

myPoints :: [(GLfloat, GLfloat, GLfloat)]
myPoints = map (\k -> (sin(2 * pi * k/12), cos(2 * pi * k/12), 0.0)) [1..12]

main :: IO ()
main = do
  (progname, _) <- getArgsAndInitialize
  createWindow "Hello World"
  displayCallback $= display
  reshapeCallback $= Just reshape
  mainLoop
  
display = do
  clear [ColorBuffer]
  renderPrimitive Quads $ do
    color $ (Color3 (1.0::GLfloat) 0 0)
    vertex $ (Vertex3 (0::GLfloat) 0 0)
    vertex $ (Vertex3 (0::GLfloat) 0.2 0)
    vertex $ (Vertex3 (0.2::GLfloat) 0.2 0)
    vertex $ (Vertex3 (0.2::GLfloat) 0 0)
    color $ (Color3 (0::GLfloat) 1 0)
    vertex $ (Vertex3 (0::GLfloat) 0 0)
    vertex $ (Vertex3 (0::GLfloat) (-0.2) 0)
    vertex $ (Vertex3 (0.2::GLfloat) (-0.2) 0)
    vertex $ (Vertex3 (0.2::GLfloat) 0 0)
    color $ (Color3 (0::GLfloat) 0 1)
    vertex $ (Vertex3 (0::GLfloat) 0 0)
    vertex $ (Vertex3 (0::GLfloat) (-0.2) 0)
    vertex $ (Vertex3 ((-0.2)::GLfloat) (-0.2) 0)
    vertex $ (Vertex3 ((-0.2)::GLfloat) 0 0)
    color $ (Color3 (1::GLfloat) 0 1)
    vertex $ (Vertex3 (0::GLfloat) 0 0)
    vertex $ (Vertex3 (0::GLfloat) 0.2 0)
    vertex $ (Vertex3 ((-0.2::GLfloat)) 0.2 0)
    vertex $ (Vertex3 ((-0.2::GLfloat)) 0 0)
  flush
  
reshape s@(Size w h) = do
  viewport $= (Position 0 0, s)
  postRedisplay Nothing