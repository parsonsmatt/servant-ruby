{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}

module Servant.Ruby where

-- import Servant.API
import Data.Monoid ((<>))

type Ruby = String

defModule :: Ruby -> Ruby
defModule body 
        = unlines 
        [ requires 
        , "module Servant" 
        , indent body 
        , "end"
        ]

defClass :: Ruby -> Ruby -> Ruby
defClass name body
        = unlines 
        [ "class " <> name
        , indent body
        , "end"
        ]

def :: Ruby -> Ruby -> Ruby -> Ruby
def name args body
        = unlines
        [ "def " <> name <> args
        , indent body
        , "end"
        ]

def' :: Ruby -> Ruby -> Ruby
def' = flip def ""

indent :: Ruby -> Ruby
indent = init . unlines . map ("  " ++) . lines

requires :: Ruby
requires = unlines $ map require 
        [ "net/http"
        ]
    where 
      require p = "require('" <> p <> "')"
