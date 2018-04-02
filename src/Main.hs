{-# LANGUAGE OverloadedStrings #-}

module Main where

import Web.Scotty
import qualified Data.Text.Lazy as T
import Control.Monad.IO.Class
import ColumbiaPacific.Attractions

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