-module(first_cowboy_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%% ===================================================================
%% Application callbacks
%% ===================================================================

start(_Type, _Args) ->
    Dispatch = cowboy_router:compile([
                                      {'_', [
                                             {"/", cowboy_static, [
                                                                   {directory, {priv_dir, turns, []}},
                                                                   {file, "index.html"},
                                                                   {mimetypes, {fun mimetypes:path_to_mimes/2, default}}
                                                                  ]},
                                            ]}
                                     ]),
    {ok, _} = cowboy:start_http(http, 100, [{port, 8080}], [
                                                            {env, [{dispatch, Dispatch}]}
                                                           ]),
    first_cowboy_sup:start_link().

stop(_State) ->
    ok.
