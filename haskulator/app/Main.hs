{-# LANGUAGE OverloadedStrings #-}

import Web.Scotty
import Data.Aeson (Value, ToJSON, FromJSON, object, (.=), (.:), toJSON, decode, parseJSON, Object)
import Data.Aeson
import Data.Text.Lazy  -- Import Data.Text and use pack to convert strings to Text
import Network.Wai.Middleware.Cors (simpleCors)  
import Control.Applicative
import Data.Text.Lazy.Encoding

data PhysicsCategory = PhysicsCategory Text
  deriving (Show)

instance ToJSON PhysicsCategory where
  toJSON (PhysicsCategory name) = object ["categoryName" .= name]

physicsCategories :: [PhysicsCategory]
physicsCategories =
  [ PhysicsCategory "Displacement"
  , PhysicsCategory "Acceleration"
  , PhysicsCategory "Momentum"
  , PhysicsCategory "Velocity"
  ]
data TotalDisplacementProblem = TotalDisplacementProblem Double Double Double
    deriving(Show)

data DisplacementProblem = DisplacementProblem Double Double 
    deriving (Show)

data MomentumProblem = MomentumProblem Double Double
    deriving(Show)

data AccelerationProblem = AccelerationProblem Double Double Double
    deriving(Show)

data VelocityProblem = VelocityProblem Double Double Double
    deriving(Show) 

instance FromJSON VelocityProblem where
    parseJSON (Object v) = VelocityProblem
        <$> v .: "initialPosition"
        <*> v .: "finalPosition"
        <*> v .: "time"

instance FromJSON AccelerationProblem where
    parseJSON (Object v) = AccelerationProblem
        <$> v .: "initialVelocity"   
        <*> v .: "finalVelocity"
        <*> v .: "time" 

instance FromJSON MomentumProblem where
    parseJSON (Object v) = MomentumProblem
        <$> v .: "mass"
        <*> v .: "velocity"

instance FromJSON TotalDisplacementProblem where
    parseJSON (Object v) = TotalDisplacementProblem
        <$> v .: "initialVelocity"
        <*> v .: "acceleration"
        <*> v .: "time"
        
instance FromJSON DisplacementProblem where
    parseJSON (Object v) = DisplacementProblem
        <$> v .: "initialPosition"
        <*> v .: "finalPosition"
  
instance ToJSON VelocityProblem where 
    toJSON (VelocityProblem p0 pf t) =
      object [ "initialPosition" .= p0
      , "finalPosition" .= pf
      , "time" .= t]    

instance ToJSON AccelerationProblem where
    toJSON (AccelerationProblem v0 vf t) =
      object [ "initialVelocity" .= v0
      , "finalVelocity" .= vf
      , "time" .= t]  

instance ToJSON MomentumProblem where
    toJSON (MomentumProblem m v) =
      object [ "mass" .= m
      , "velocity" .= v]

instance ToJSON TotalDisplacementProblem where
    toJSON (TotalDisplacementProblem v0 a t) =
      object [ "initialVelocity" .= v0
        , "acceleration" .= a
        , "time" .= t]
instance ToJSON DisplacementProblem where
    toJSON (DisplacementProblem u f) =
      object [ "initialPosition" .= u
        , "finalPosition" .= f]

calculateVelocity :: VelocityProblem -> Double
calculateVelocity (VelocityProblem initialPosition finalPosition time) = calculateDisplacementWithoutVelocityOrAcceleration finalPosition initialPosition / time 

calculateAcceleration :: AccelerationProblem -> Double 
calculateAcceleration (AccelerationProblem initialVelocity finalVelocity time) = (finalVelocity - initialVelocity) / time

calculateMomentum :: MomentumProblem -> Double 
calculateMomentum (MomentumProblem mass velocity) = mass * velocity

calculateTotalDisplacement :: TotalDisplacementProblem -> Double 
calculateTotalDisplacement  (TotalDisplacementProblem initialVelocity acceleration time) =
  initialVelocity * time + 0.5 * acceleration * time^2

calculateDisplacementWithoutVelocityOrAcceleration :: Double -> Double -> Double 
calculateDisplacementWithoutVelocityOrAcceleration finalPosition initialPosition = finalPosition - initialPosition

main :: IO ()
main = scotty 3000 $ do

  middleware simpleCors  -- Enable CORS

  get "/categories" $ do
    Web.Scotty.json physicsCategories
  
  post "/calculate/:category" $ do
    categoryParam <- param "category" :: ActionM Text
    
   
    case categoryParam of
        "Displacement" -> do
            mydata <- jsonData :: ActionM TotalDisplacementProblem
            let totalDisplacement = calculateTotalDisplacement mydata
            Web.Scotty.json totalDisplacement
        "Momentum" -> do
            mydata <- jsonData :: ActionM MomentumProblem
            let momentum = calculateMomentum mydata
            Web.Scotty.json momentum
        "Acceleration" -> do
            mydata <- jsonData :: ActionM AccelerationProblem
            let acceleration = calculateAcceleration mydata
            Web.Scotty.json acceleration
        "Velocity" -> do
            mydata <- jsonData :: ActionM VelocityProblem
            let velocity = calculateVelocity mydata
            Web.Scotty.json velocity


