-- |
-- Module      : Elrond.Server
-- Description :
-- Copyright   : (c) Jonatan H Sundqvist, 2015
-- License     : MIT
-- Maintainer  : Jonatan H Sundqvist
-- Stability   : experimental|stable
-- Portability : POSIX (not sure)
--

-- Created December 22 2015

-- TODO | -
--        -

-- SPEC | -
--        -



--------------------------------------------------------------------------------------------------------------------------------------------
-- GHC Pragmas
--------------------------------------------------------------------------------------------------------------------------------------------
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ViewPatterns      #-}



--------------------------------------------------------------------------------------------------------------------------------------------
-- API
--------------------------------------------------------------------------------------------------------------------------------------------
module Elrond.Server where



--------------------------------------------------------------------------------------------------------------------------------------------
-- We'll need these
--------------------------------------------------------------------------------------------------------------------------------------------
import qualified Data.ByteString.Lazy as BS
import           Data.Functor
import           Data.Convertible

import Text.Printf

import Network.HTTP.Server
import Network.HTTP.Server.Logger
import Network.URL

-- import Database.HDBC
-- import Database.HDBC.Sqlite3

-- import System.Directory

import qualified Data.Aeson as JSON
import           Data.Aeson (toJSON, fromJSON)

import Control.Concurrent
import Control.Monad (void)
import Control.Lens

import Elrond.Core.Types



--------------------------------------------------------------------------------------------------------------------------------------------
-- Functions
--------------------------------------------------------------------------------------------------------------------------------------------

-- |
-- TODO: Pling
start :: IO ()
start = serverWith config handlerequest
  where
    handlerequest sockaddr url request = (printf "Request: %s\n" (show url) :: IO ()) >> return response
    headers  = [Header HdrContentType "application/json", Header HdrContentLength (show $ length htmlbody)]
    response = Response (2,0,0) "Reason goes here" headers htmlbody
    config   = Config stdLogger (show ip) 8000
    ip       = IP (192, 168, 1, 88)
    htmlbody = ""
