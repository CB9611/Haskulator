--This program is for calculating Final Velocity

calculateFinalVelocity :: Double -> Double -> Double -> Double
calculateFinalVelocity initialVelocity acceleration time = initialVelocity + (acceleration * time)

main :: IO ()
main = do
    putStrLn "Final Velocity Calculator"
    putStrLn "Enter initial velocity (m/s):"
    initialVelocityStr <- getLine
    let initialVelocity = read initialVelocityStr :: Double

    putStrLn "Enter acceleration (m/s^2):"
    accelerationStr <- getLine
    let acceleration = read accelerationStr :: Double

    putStrLn "Enter time (s):"
    timeStr <- getLine
    let time = read timeStr :: Double

    let finalVelocity = calculateFinalVelocity initialVelocity acceleration time
    putStrLn ("Final Velocity: " ++ show finalVelocity ++ " m/s")