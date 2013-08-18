-module(toppage_handler).

-export([init/3,
         handle/2,
         terminate/3
        ]).

init(_Transport, Req, []) ->
    {ok, Req, undefined}.

handle(Req, State) ->
    {ok, Binary} = file:read_file("../main.html"),
    {ok, Req1} = cowboy_req:set_resp_body(Binary, Req),
    {ok, Req2} = cowboy_req:reply(200, [], Req1),
    {ok, Req2, State}.

terminate(_Reason, _Req, _State) ->
    ok.
