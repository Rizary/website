{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_dependent_sum_template (
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
version = Version [0,0,0,5] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/Rizitecs/.cabal/bin"
libdir     = "/Users/Rizitecs/.cabal/lib/x86_64-osx-ghcjs-0.2.1-ghc8_0_2/dependent-sum-template-0.0.0.5-inplace"
dynlibdir  = "/Users/Rizitecs/.cabal/lib/x86_64-osx-ghcjs-0.2.1-ghc8_0_2"
datadir    = "/Users/Rizitecs/.cabal/share/x86_64-osx-ghcjs-0.2.1-ghc8_0_2/dependent-sum-template-0.0.0.5"
libexecdir = "/Users/Rizitecs/.cabal/libexec"
sysconfdir = "/Users/Rizitecs/.cabal/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "dependent_sum_template_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "dependent_sum_template_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "dependent_sum_template_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "dependent_sum_template_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "dependent_sum_template_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "dependent_sum_template_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
