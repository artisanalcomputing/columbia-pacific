{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}

module ColumbiaPacific.Attractions where

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
