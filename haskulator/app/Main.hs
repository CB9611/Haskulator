{-# LANGUAGE OverloadedStrings #-}

import Web.Scotty
import Data.Aeson (ToJSON, object, (.=),toJSON)
import Data.Text.Lazy (Text, pack)  -- Import Data.Text and use pack to convert strings to Text
import Network.Wai.Middleware.Cors (simpleCors)  

data PhysicsCategory = PhysicsCategory Text
  deriving (Show)

instance ToJSON PhysicsCategory where
  toJSON (PhysicsCategory name) = object ["categoryName" .= name]

physicsCategories :: [PhysicsCategory]
physicsCategories =
  [ PhysicsCategory "Displacement"
  , PhysicsCategory "Acceleration"
  , PhysicsCategory "Projectile"
  ]

main :: IO ()
main = scotty 3000 $ do

  middleware simpleCors  -- Enable CORS

  get "/categories" $ do
    json physicsCategories