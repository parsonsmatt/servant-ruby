{-# LANGUAGE CPP                  #-}
{-# LANGUAGE ConstraintKinds      #-}
{-# LANGUAGE DataKinds            #-}
{-# LANGUAGE FlexibleContexts     #-}
{-# LANGUAGE FlexibleInstances    #-}
{-# LANGUAGE ScopedTypeVariables  #-}
{-# LANGUAGE TypeFamilies         #-}
{-# LANGUAGE TypeOperators        #-}
{-# LANGUAGE UndecidableInstances #-}

module Servant.Ruby.Internal where

import Servant.API
import Data.Proxy
import GHC.Exts (Constraint)
import GHC.TypeLits

data AjaxReq

class HasRB (layout :: *) where
    type RB layout :: *
    rubyFor :: Proxy layout -> AjaxReq -> RB layout
