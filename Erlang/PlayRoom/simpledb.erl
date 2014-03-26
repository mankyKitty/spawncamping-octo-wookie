-module(simpledb).
-compile(export_all).

-record(cd,{title,
            artist,
            rating,
            ripped}).

make_cd(Title,Artist,Rating,Ripped) when is_integer(Rating) andalso is_boolean(Ripped) ->
    #cd{title=Title, artist=Artist, rating=Rating, ripped=Ripped}.

artist(CD) ->
    CD#cd.artist.
