{-# LANGUAGE TemplateHaskell #-}

module Snap.Loader.Static
  ( loadSnapTH
  ) where

------------------------------------------------------------------------------
import Language.Haskell.TH (Exp, Name, Q, varE)


------------------------------------------------------------------------------
-- | This function provides a non-magical type-compatible loader for
-- the one in snap-dynamic's Snap.Loader.Devel, allowing switching one
-- import to provide production-mode compilation.
--
-- This could be considered a TH wrapper around a function
--
-- > loadSnap :: Typeable a => IO a -> (a -> IO (Snap (), IO ()))
-- >                        -> [String] -> IO (a, Snap (), IO ())
--
-- The third argument is unused, and only present for
-- type-compatibility with Snap.Loader.Devel
loadSnapTH :: Q Exp -> Name -> [String] -> Q Exp
loadSnapTH initializer action _additionalWatchDirs =
    [| do value <- $initializer
          (site, conf) <- $(varE action) value
          return (value, site, conf) |]
