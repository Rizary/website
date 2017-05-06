{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_reflex_dom_core (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [0,4] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/Rizitecs/.cabal/bin"
libdir     = "/Users/Rizitecs/.cabal/lib/x86_64-osx-ghcjs-0.2.1-ghc8_0_2/.fake.reflex-dom-core-0.4"
dynlibdir  = "/Users/Rizitecs/.cabal/lib/x86_64-osx-ghcjs-0.2.1-ghc8_0_2"
datadir    = "/Users/Rizitecs/.cabal/share/x86_64-osx-ghcjs-0.2.1-ghc8_0_2/reflex-dom-core-0.4"
libexecdir = "/Users/Rizitecs/.cabal/libexec"
sysconfdir = "/Users/Rizitecs/.cabal/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "reflex_dom_core_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "reflex_dom_core_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "reflex_dom_core_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "reflex_dom_core_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "reflex_dom_core_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "reflex_dom_core_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
