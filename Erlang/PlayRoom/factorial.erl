-module(factorial).
-export([fac/1,
         getState/1,
         len/1,
         tail_fac/1,
         tail_fac/2,
         tail_len/1,
         tail_len/2,
         duplicate/2,
         tail_dup/2,
         tail_dup/3]).

-record(state, {id, msg_list=[]}).

getState(0)->
    #state{id=1};
getState(N) when N>0 ->
    #state{id=N}.

fac(0)->
    1;
fac(N) when N>0 ->
    N * fac((N - 1)).

%% tail recursive factorial
tail_fac(N) ->
    tail_fac(N,1).

tail_fac(0,Acc) ->
    Acc;
tail_fac(N,Acc) when N > 0 ->
    tail_fac(N-1,N*Acc).

%% My length function!
len([]) ->
    0;
len([_|T]) ->
    1 + len(T).

%% Tail recursive len
tail_len(L) ->
    tail_len(L,0).

tail_len([],Acc) ->
    Acc;
tail_len([_|T],Acc) ->
    tail_len(T,Acc+1).

%% Duplicate N times
duplicate(0,_) ->
    [];
duplicate(N,Term) when N > 0 ->
    [Term|duplicate(N-1,Term)].

%% Tail recursive Duplicate
tail_dup(N,Term) ->
    tail_dup(N,Term,[]).

tail_dup(0,_,List) ->
    List;
tail_dup(N,Term,List) when N > 0 ->
    tail_dup(N-1, Term, [Term|List]).
