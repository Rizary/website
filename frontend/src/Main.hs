{-# LANGUAGE OverloadedStrings, RecursiveDo, ScopedTypeVariables, FlexibleContexts, TypeFamilies, ConstraintKinds #-}

import Prelude hiding (mapM, mapM_, all, sequence)

import           Control.Monad hiding (mapM, mapM_, forM, forM_, sequence)
import           Control.Monad.Fix
import           Data.Map (Map)
import qualified Data.Map                  as Map
import           Data.Foldable
import           Data.Monoid ((<>))
import           Data.Text (Text)
import qualified Data.Text                 as T

import Reflex
import Reflex.Dom.Core
import Reflex.Dom.Builder.Static
import Data.Text.Encoding (encodeUtf8)
import Debug.Trace (trace)

--------------------------------------------------------------------------------
-- View
--------------------------------------------------------------------------------

--main :: IO()
main = do
  (_, bs) <- renderStatic $ el "div" $ text "Welcome to Reflex"
  print bs

