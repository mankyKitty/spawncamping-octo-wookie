-- Trying to recreate what I lost, and succeeding like a boss!

-- -- | Time related imports
-- import Data.Time (UTCTime)
-- import Data.Time.Format (readTime)
-- import System.Locale (defaultTimeLocale)

-- | Command line arguments
import System.Environment (getArgs)

-- | Delicious bytestring goodness!
import qualified Data.ByteString as B

-- | Fetch some convenience items (words,lines etc)
import qualified Data.ByteString.Char8 as BC

-- | Use the 'bytestring-lexer' package to read in nums
import Data.ByteString.Lex.Integral (readDecimal)
import Data.ByteString.Lex.Double (readDouble)

-- | This, is a checkin.
data CheckIn = CheckIn Int BC.ByteString Double Double Int
             deriving (Show)

-- | Find the number or a default value for a read bytestring
getNum :: (Num a) => Maybe (a, B.ByteString) -> a
getNum a = case a of
  Nothing    -> 0
  Just (n,_) -> n

-- getTime :: [Char] -> UTCTime
-- getTime = readTime defaultTimeLocale "%FT%XZ"

-- | Processes an list of bytestrings into a checkin
parseCheckIn :: [B.ByteString] -> CheckIn
parseCheckIn [u,a,b,c,d] = CheckIn user a lat long locId
  where
    user  = getInt u
    locId = getInt d
    lat   = getDub b
    long  = getDub c
    -- Read Integer From ByteString
    getInt = (getNum . readDecimal)
    -- Read Double From ByteString
    getDub = (getNum . readDouble)
    -- Process our timestamp into a Haskell one.
    -- time = (getTime . BC.unpack) a
    

main :: IO ()
main =
  do
    [from] <- getArgs
    fr <- B.readFile from
    let checkins = ((map BC.words) . BC.lines) fr in
      print $ map parseCheckIn checkins

