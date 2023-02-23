module Syntax.Clearly ( appliedOn
               , composes
               , timesDo
               , timesDo_
               , appliedOnBy
               , thenApply) where

import Control.Monad ( replicateM
                     , replicateM_)
import GHC.Prim (TYPE)
import Data.Function ((&))

infixr 0 `appliedOn`
appliedOn :: forall r a (b :: TYPE r). (a -> b) -> a -> b 
appliedOn = ($)

infixr 9 `composes`
composes :: (b -> c) -> (a -> b) -> a -> c
composes = (.)

infixl 1 `timesDo`
timesDo :: Applicative m => Int -> m a -> m [a]
timesDo = replicateM

infixl 1 `timesDo_`
timesDo_ :: Applicative m => Int -> m a -> m ()
timesDo_ = replicateM_

infixl 1 `appliedOnBy`
appliedOnBy :: a -> (a -> b) -> b
appliedOnBy = (&)

infixr 9 `thenApply`
thenApply :: (a -> b) -> (b -> c) -> a -> c
thenApply = flip (.)