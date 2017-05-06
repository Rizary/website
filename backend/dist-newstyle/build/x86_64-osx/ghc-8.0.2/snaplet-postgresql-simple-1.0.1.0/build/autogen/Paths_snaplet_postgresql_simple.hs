{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_snaplet_postgresql_simple (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [1,0,1,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/Rizitecs/.cabal/bin"
libdir     = "/Users/Rizitecs/.cabal/lib/x86_64-osx-ghc-8.0.2/snaplet-postgresql-simple-1.0.1.0-inplace"
dynlibdir  = "/Users/Rizitecs/.cabal/lib/x86_64-osx-ghc-8.0.2"
datadir    = "/Users/Rizitecs/.cabal/share/x86_64-osx-ghc-8.0.2/snaplet-postgresql-simple-1.0.1.0"
libexecdir = "/Users/Rizitecs/.cabal/libexec"
sysconfdir = "/Users/Rizitecs/.cabal/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "snaplet_postgresql_simple_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "snaplet_postgresql_simple_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "snaplet_postgresql_simple_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "snaplet_postgresql_simple_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "snaplet_postgresql_simple_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "snaplet_postgresql_simple_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
