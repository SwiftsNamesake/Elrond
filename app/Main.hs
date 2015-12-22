-- |
-- Module      : Main
-- Description :
-- Copyright   : (c) Jonatan H Sundqvist, 2015
-- License     : MIT
-- Maintainer  : Jonatan H Sundqvist
-- Stability   : experimental|stable
-- Portability : POSIX (not sure)
--

-- Created December 21 2015

-- TODO | -
--        -

-- SPEC | -
--        -



--------------------------------------------------------------------------------------------------------------------------------------------
-- GHC Pragmas
--------------------------------------------------------------------------------------------------------------------------------------------



--------------------------------------------------------------------------------------------------------------------------------------------
-- API
--------------------------------------------------------------------------------------------------------------------------------------------
module Main where



--------------------------------------------------------------------------------------------------------------------------------------------
-- We'll need these
--------------------------------------------------------------------------------------------------------------------------------------------
import System.Environment (getArgs)
import Control.Concurrent

import qualified Elrond.Core   as Core
import qualified Elrond.Server as Server
import qualified Elrond.Client as Client



--------------------------------------------------------------------------------------------------------------------------------------------
-- Entry point
--------------------------------------------------------------------------------------------------------------------------------------------

-- |
main :: IO ()
main = do
  putStrLn "Elvish nonsense and dwarvish tenacity."
  args <- getArgs
  case take 1 args of
    ["server"] -> Server.start
    ["client"] -> Client.start
    _          -> putStrLn "Put up your umbrellas, folks. Shit just hit the fan."
  threadDelay $ round (5.0 * 10^6)
  putStrLn "Shutting down..."
  error "TODO: Figure out a better way to stop the server."
