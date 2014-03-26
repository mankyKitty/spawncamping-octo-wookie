-module(turns_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%% ===================================================================
%% Application callbacks
%% ===================================================================

start(_Type, _Args) ->
    Dispatch = cowboy_router:compile([{'_',
                                     [{[<<"players">>], players, []},
                                     {[<<"npcs">>], players, []}]}]),
    {ok, _} = cowboy:start_http(http, 100, [{port, 8080}], [{env, [{dispatch, Dispatch}]}]),
    turns_sup:start_link().

stop(_State) ->
    ok.
