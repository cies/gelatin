module Main where

import System.Environment
import Gelatin.Core.Rendering
import Graphics.UI.GLFW
import Examples.PolylineTest
import Examples.PolylineWinding
import Examples.Masking
import Examples.Text

examples :: [(String, Window -> GeomRenderSource -> BezRenderSource -> IO ())]
examples = [("polylineTest", polylineTest)
           ,("polylineWinding", polylineWinding)
           ,("masking", masking)
           ,("text", text)
           ]

main :: IO ()
main = do
    name:_ <- getArgs
    True   <- initGelatin
    win    <- newWindow 800 600 "Syndeca Mapper" Nothing Nothing
    grs    <- loadGeomRenderSource
    brs    <- loadBezRenderSource

    let Just example = lookup name examples

    example win grs brs
