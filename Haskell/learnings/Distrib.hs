factors :: [Integer] -> Integer -> [Integer]
factors qs@(p:ps) n
        | n <= 1 = []
        | m == 0 = p : factors qs d
        | otherwise = factors ps n
        where
                (d,m) = n `divMod` p
