import System.Environment(getArgs)
import System.IO
import Language.VintageBasic.Executer(executeFile)
import Language.VintageBasic.BasicMonad(runProgram)
import Control.Monad.CPST.DurableTraps(done)
import IO.IOStream

main :: IO ()
main = do
    args <- getArgs
    runProgram (IOStream stdin) (IOStream stdout) $ do
        sequence_ [executeFile fileName | fileName <- args]
        done
