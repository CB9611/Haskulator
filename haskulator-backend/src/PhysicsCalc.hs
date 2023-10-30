module PhysicsCalc where

-- Calculate velocity based on initial velocity, acceleration, and time
calculateVelocity :: Double -> Double -> Double -> Double
calculateVelocity v0 a t = v0 + a * t

-- Calculate velocity based on final velocity, initial velocity, and time
calculateVelocityWithFinal :: Double -> Double -> Double -> Double
calculateVelocityWithFinal vf v0 t = (vf - v0) / t

-- Calculate displacement based on initial velocity, acceleration, and time
calculateDisplacement :: Double -> Double -> Double -> Double
calculateDisplacement v0 a t = v0 * t + 0.5 * a * t * t

-- Calculate acceleration based on initial velocity, final velocity, and time
calculateAcceleration :: Double -> Double -> Double -> Double
calculateAcceleration v0 v t = (v - v0) / t

-- Calculate time based on initial velocity, final velocity, and acceleration
calculateTime :: Double -> Double -> Double -> Double
calculateTime v0 v a = (v - v0) / a

