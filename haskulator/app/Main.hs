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
  , PhysicsCategory "Projectile"
  , PhysicsCategory "Momentum"
  , PhysicsCategory "Velocity"
  ]


data DisplacementProblem = DisplacementProblem Double Double Double
    deriving (Show)

instance FromJSON DisplacementProblem where
    parseJSON (Object v) = DisplacementProblem
        <$> v .: "initialVelocity"
        <*> v .: "angle"
        <*> v .: "acceleration"


instance ToJSON DisplacementProblem where
    toJSON (DisplacementProblem v0 angle a) =
      object [ "initialVelocity" .= v0
        , "angle" .= angle
        , "acceleration" .= a]
main :: IO ()
main = scotty 3000 $ do

  middleware simpleCors  -- Enable CORS

  get "/categories" $ do
    Web.Scotty.json physicsCategories
  
  post "/calculate/:category" $ do
    categoryParam <- param "category" :: ActionM Text
    mydata <- jsonData :: ActionM DisplacementProblem
    Web.Scotty.json mydata

