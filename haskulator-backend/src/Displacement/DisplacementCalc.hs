--This program is for calculating Displacement

calculateDisplacement :: Double -> Double -> Double -> Double
calculateDisplacement initialVelocity acceleration time = initialVelocity * time + (0.5 * acceleration * time * time)

main :: IO ()
main = do
    putStrLn "Displacement Calculator"
    putStrLn "Enter initial velocity (m/s):"
    initialVelocityStr <- getLine
    let initialVelocity = read initialVelocityStr :: Double

    putStrLn "Enter acceleration (m/s^2):"
    accelerationStr <- getLine
    let acceleration = read accelerationStr :: Double

    putStrLn "Enter time (s):"
    timeStr <- getLine
    let time = read timeStr :: Double

    let displacement = calculateDisplacement initialVelocity acceleration time
    putStrLn ("Displacement: " ++ show displacement ++ " meters")