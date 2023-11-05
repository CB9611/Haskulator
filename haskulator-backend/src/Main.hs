module Main where

import PhysicsCalc (calculateDisplacementWithoutVelocityOrAcceleration, calculateDisplacement, calculateAcceleration, calculateAccelerationForceMass, calculateVelocity, calculateVelocityWithFinal)

main :: IO ()
main = do
    putStrLn "Choose the type of problem you want to solve:"
    putStrLn "1. Displacement"
    putStrLn "2. Acceleration"
    putStrLn "3. Velocity"
    choice <- getLine

    case choice of 
     "1" -> solveDisplacement
     "2" -> solveAcceleration
     "3" -> solveVelocity
     "" -> putStrLn "Invalid choice: Input is empty"
     _ -> putStrLn "Invalid choice: Unrecognized option"

solveDisplacement :: IO ()
solveDisplacement = do
    putStrLn "You selected Displacement."
    putStrLn "Choose what inputs you have:"
    putStrLn "1. Initial and Final Positions"
    putStrLn "2. Initial Velocity, Acceleration, and Time"
    subChoice <- getLine

    case subChoice of
        "1" -> do
            putStrLn "Enter initial position (m):"
            initialPositionStr <- getLine
            let initialPosition = read initialPositionStr :: Double

            putStrLn "Enter final position (m):"
            finalPositionStr <- getLine
            let finalPosition = read finalPositionStr :: Double

            let displacement = calculateDisplacementWithoutVelocityOrAcceleration initialPosition finalPosition
            putStrLn $ "The displacement is: " ++ show displacement ++ " m"

        "2" -> do
            putStrLn "Enter initial velocity (m/s):"
            initialVelocityStr <- getLine
            let initialVelocity = read initialVelocityStr :: Double

            putStrLn "Enter acceleration (m/s^2):"
            accelerationStr <- getLine
            let acceleration = read accelerationStr :: Double

            putStrLn "Enter time (seconds):"
            timeStr <- getLine
            let time = read timeStr :: Double

            let displacement = calculateDisplacement initialVelocity acceleration time
            putStrLn $ "The displacement is: " ++ show displacement ++ " m"

        "" -> putStrLn "Invalid choice"

solveAcceleration :: IO ()
solveAcceleration = do
    putStrLn "You selected Acceleration."
    putStrLn "Choose what inputs you have:"
    putStrLn "1. Initial and Final Velocity"
    putStrLn "2. Force and Mass"
    subChoice <- getLine

    case subChoice of
        "1" -> do
            putStrLn "Enter initial velocity (m/s):"
            initialVelocityStr <- getLine
            let initialVelocity = read initialVelocityStr :: Double

            putStrLn "Enter final velocity (m/s):"
            finalVelocityStr <- getLine
            let finalVelocity = read finalVelocityStr :: Double

            putStrLn "Enter time (seconds):"
            timeStr <- getLine
            let time = read timeStr :: Double

            let acceleration = calculateAcceleration initialVelocity finalVelocity time
            putStrLn $ "The acceleration is: " ++ show acceleration ++ " m/s^2"

        "2" -> do
            putStrLn "Enter force (N):"
            forceStr <- getLine
            let force = read forceStr :: Double

            putStrLn "Enter mass (kg):"
            massStr <- getLine
            let mass = read massStr :: Double

            putStrLn "Enter time (seconds):"
            timeStr <- getLine
            let time = read timeStr :: Double

            let acceleration = calculateAccelerationForceMass force mass
            putStrLn $ "The acceleration is: " ++ show acceleration ++ " m/s^2"

        "" -> putStrLn "Invalid choice"

solveVelocity :: IO ()
solveVelocity = do
    putStrLn "You selected Velocity."
    putStrLn "Choose what inputs you have:"
    putStrLn "1. Initial velocity, Acceleration, and Time"
    putStrLn "2. Final Velocity, Initial velocity, and Time"
    subChoice <- getLine

    case subChoice of
        "1" -> do
            putStrLn "Enter initial velocity (m/s):"
            initialVelocityStr <- getLine
            let initialVelocity = read initialVelocityStr :: Double

            putStrLn "Enter acceleration (m/s^2):"
            accelerationStr <- getLine
            let acceleration = read accelerationStr :: Double

            putStrLn "Enter time (seconds):"
            timeStr <- getLine
            let time = read timeStr :: Double

            let velocity = calculateVelocity initialVelocity acceleration time
            putStrLn $ "The velocity is: " ++ show velocity ++ " (m/s)"

        "2" -> do
            putStrLn "Enter final velocity (m/s):"
            finalVelocityStr <- getLine
            let finalVelocity = read finalVelocityStr :: Double

            putStrLn "Enter initial velocity (m/s):"
            initialVelocityStr <- getLine
            let initialVelocity = read initialVelocityStr :: Double

            putStrLn "Enter time (seconds):"
            timeStr <- getLine
            let time = read timeStr :: Double

            let velocity = calculateVelocityWithFinal finalVelocity initialVelocity time
            putStrLn $ "The velocity is: " ++ show velocity ++ " (m/s)"

        "" -> putStrLn "Invalid choice"