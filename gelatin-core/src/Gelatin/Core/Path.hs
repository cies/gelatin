{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE DeriveGeneric #-}
module Gelatin.Core.Path where

import Gelatin.Core.Bounds
import Gelatin.Core.Transform
import Gelatin.Core.Shape
import Linear
import Data.Hashable
import GHC.Generics

newtype Path a = Path { unPath :: [a] } deriving (Show, Generic)

instance Transformable Transform (Path (V2 Float)) where
    transform t (Path vs) = Path $ transform t vs

instance Hashable a => Hashable (Path a)

pathBounds :: Path (V2 Float) -> BBox
pathBounds = polyBounds . unPath

newtype Size = Size (V2 Float)

sizeToPaths :: Size -> [Path (V2 Float)]
sizeToPaths (Size sz) = [Path $ box sz]


