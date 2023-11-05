module PhysicsCalc (calculateDisplacement, calculateDisplacementWithoutVelocityOrAcceleration, calculateAcceleration, calculateAccelerationForceMass, calculateVelocity, calculateVelocityWithFinal) where


-- Calculate displacement based on initial velocity, acceleration, and time
calculateDisplacement :: Double -> Double -> Double -> Double
calculateDisplacement initialVelocity acceleration time = initialVelocity * time + 0.5 * acceleration * time * time

-- Calculate displacement based on final and initial position
calculateDisplacementWithoutVelocityOrAcceleration :: Double -> Double -> Double 
calculateDisplacementWithoutVelocityOrAcceleration finalPosition initialPosition = finalPosition - initialPosition


-- Calculate acceleration based on initial velocity, final velocity, and time
calculateAcceleration :: Double -> Double -> Double -> Double
calculateAcceleration initialVelocity finalVelocity time = (finalVelocity - initialVelocity) / time

-- Calculate accelaeration with force and mass
calculateAccelerationForceMass :: Double -> Double -> Double
calculateAccelerationForceMass force mass = force / mass


-- Calculate velocity based on initial velocity, acceleration, and time
calculateVelocity :: Double -> Double -> Double -> Double
calculateVelocity initialVelocity acceleration time = initialVelocity + acceleration * time

-- Calculate velocity based on final velocity, initial velocity, and time
calculateVelocityWithFinal :: Double -> Double -> Double -> Double
calculateVelocityWithFinal finalVelocity initialVelocity time = (finalVelocity - initialVelocity) / time

