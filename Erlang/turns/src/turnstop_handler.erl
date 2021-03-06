-module(turnstop_handler).

-export([init/3,
         handle/2,
         terminate/3
        ]).

init(_Transport, Req, []) ->
    {ok, Req, undefined}.

handle(Req, State) ->
    {ok, Req2} = cowboy_req:reply(200, [], <<"Error">>, Req),
    {ok, Req2, State}.

terminate(_Reason, _Req, _State) ->
    ok.
