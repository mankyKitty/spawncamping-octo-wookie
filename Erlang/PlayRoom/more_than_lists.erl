%%% File    : more_than_lists.erl
%%% Author  : Sean Chalmers <manky@Hooked.local>
%%% Created : 19 Sep 2013 by Sean Chalmers <manky@Hooked.local>

-module(more_than_lists).
-author('manky@Hooked.local').

-export([len/1,
         tail_len/1
        ]).

len([])    -> 0;
len([_|T]) -> 1 + len(T).

tail_len(L) -> tail_len(L, 0).

tail_len([], Acc)    -> Acc;
tail_len([_|T], Acc) -> tail_len(T, Acc + 1).
