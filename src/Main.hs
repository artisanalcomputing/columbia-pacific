{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}

module Main where

import Web.Scotty
import qualified Data.Text.Lazy as T
import Control.Monad.IO.Class
import Data.Aeson (FromJSON, ToJSON)
import GHC.Generics

data Attraction = Attraction { attractionId :: String
                         , attractionName :: String
                         , location :: String
                         , information :: String
                         , address :: String
                         , image :: String
                         , description :: String } 
  deriving (Show, Generic)

instance ToJSON Attraction
instance FromJSON Attraction

ftstevens :: Attraction
ftstevens = Attraction { attractionId = "1"
                 , attractionName = "Fort Stevens State Park"
                 , location = "clatsop"
                 , information = "visitftstevens.com"
                 , address = "100 Peter Iredale Road, Hammond, OR"
                 , image = ""
                 , description = "Large state park with trails, picnic areas and camping."}

ftclatsop :: Attraction
ftclatsop = Attraction { attractionId = "2"
                 , attractionName = "Fort Clatsop"
                 , location = "clatsop"
                 , information = "nps.gov"
                 , address = "92343 Fort Clatsop Road - Astoria, OR."
                 , image = ""
                 , description = "Reconstructed fort, picnic areas and trails." }

allAttractions :: [Attraction]
allAttractions = [ftstevens, ftclatsop]

matchesId :: String -> Attraction -> Bool
matchesId id attraction = attractionId attraction == id

main :: IO ()
main = do
  putStrLn "Starting Server..."
  scotty 3000 $ do
    get "/attractions" $ do
      json allAttractions
    get "/attractions/:id" $ do
      id <- param "id"
      json (filter (matchesId id) allAttractions)
    post "/attractions" $ do
      attraction <- jsonData :: ActionM Attraction
      json attraction


