module Pong where

delta = lift inSeconds (fps 50)

data KeyInput = KeyInput Bool Int Int

defaultKeyInput = KeyInput False 0 0

keyInput =
  lift3 KeyInput Keyboard.space (lift .y Keyboard.wasd) (lift .y Keyboard.arrows)

data Input = Input Float KeyInput

input =
  sampleOn delta (lift2 Input delta keyInput)

data Paddle = Paddle Float                    -- y-position
data Ball = Ball (Float,Float) (Float, Float) -- position and velocity

data Score = Score Int Int
data State = Play | BetweenRounds

data GameState = GameState State Score Ball Paddle Paddle

gameWidth = 600
gameHeight = 400
halfWidth = gameWidth / 2
halfHeight = gameHeight / 2

defaultGame = GameState BetweenRounds
                        (Score 0 0)
                        (Ball (halfWidth halfHeight) (150,150))
                        (Paddle halfHeight)
                        (Paddle halfHeight)

stepPaddle delta dir (Paddle y) =
  Paddle $ clamp 20 (gameHeight-20) (y - dir * 200 * delta)

makePositive n = if n > 0
                 then n
                 else 0 - n

makeNegative n = if n > 0
                 then 0 - n
                 else n

within epsilon n x = x > n - epsilon && x < n + epsilon

stepVelocity velocity lowerCollision upperCollision =
 if | lowerCollision -> makePositive velocity
    | upperCollision -> makeNegative velocity
    | otherwise      -> velocity

stepBall delta (Ball (x,y) (vx,vy)) (Paddle y1) (Paddle y2) =
  let hitPaddle1 = within 20 y1 y && within 8 25 x
      hitPaddle2 = within 20 y2 y && within 8 (gameWidth - 25) x
      vx' = stepVelocity vx hitPaddle1 hitPaddle2
      vy' = stepVelocity vy (y < 7) (y > gameHeight - 7)
      scored = x > gameWidth || x < 0
      x' = if scored then halfWidth else x + vx' * delta
      y' = if scored then halfHeight else y + vy' * delta
  in (Ball (x',y') (vx',vy'),
      if x > gameWidth then 1 else 0,
      if x < 0         then 1 else 0)

stepGame (Input delta (KeyInput space dir1 dir2))
  (GameState state (Score s1 s2) ball paddle1 paddle2) =
  let (ball', s1', s2') = if state == Play
                          then stepBall delta ball paddle1 paddle2
                          else (ball, 0, 0)
      state' = case state of Play -> if s1' /= s2'
                                     then BetweenRounds
                                     else state
                             BetweenRounds -> if space
                                              then Play
                                              else state
  in GameState state' (Score (s1+s1') (s2+s2')) ball' (stepPaddle delta dir1 paddle1) (stepPaddle delta dir2 paddle2)

gameState = foldp stepGame defaultGame input

scoreBoard w inPlay p1 p2 =
  let code = text . monospace . toText
      stack top bottom = flow down [code " ", code top, code bottom]
      msg = width w . monospace (toText "Press SPACE to begin")
      score = width w . box 2 (flow right
        [stack "W" "S", rectangle 20 1,
         text . Text.height 4 $ show p1 ++ toText "     " ++ show p2,
         rectangle 20 1, stack "&uarr;" "&darr;"])
  in
   if inPlay
   then score
   else score `above` msg

display (w,h) (GameState state (Score p1 p2) (Ball pos _) (Paddle y1) (Paddle y2)) =
  layers
    [scoreBoard w (state == Play) p1 p2,
     let pongGreen = rgb 60 100 60 in
     size w h . box 5 $ collage gameWidth gameHeight
       [filled pongGreen (rect gameWidth gameHeight (halfWidth,halfHeight)),
        filled white (oval 15 15 pos), -- ball
        filled white (rect 10 40 ( 20, y1)) -- first paddle
        filled white (rect 10 40 (gameWidth - 20, y2)) -- second paddle
        ]
    ]

main = lift2 display Window.dimensions gameState
