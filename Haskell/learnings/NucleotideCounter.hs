-- Nucleotide Counter
-- Test Case & Useage
-- dna = "AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC"
-- nucleotide_counts dna
-- # => {'A' => 20, 'T' => 21, 'G' => 17, 'C' => 12}

-- Imports
import Data.List

dna = "AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC"

nucleotide_counts :: [Char] -> [(Char, Int)]
nucleotide_counts s = [(x,(length $ filter (\y -> x == y) s)) | x <- "AGCT"]
