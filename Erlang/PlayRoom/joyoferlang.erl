-module(joyoferlang).
-export([incr/1,decr/1,add/2,sub/2]).

incr(A)->
    A + 1.

decr(A)->
    A - 1.

% Add two postiive integers
add(A, 0) ->
    A;
add(A, B) ->
    add(incr(A), decr(B)).

% Subtract B (positive) from A
sub(A, 0) ->
    A;
sub(A, B) ->
    sub(decr(A), decr(B)).
