-module(sup).

%% API
-export([start_server/0]).

%% Callbacks
-export([supervise/0]).

%% API Funs
start_server() ->
    spawn(?MODULE, supervise, []).

%% Callback funs
supervise() ->
    process_flag(trap_exit, true),
    Pid = no_otp:start(),
    link(Pid),
    receive
        {'EXIT', Pid, Reason} ->
            case Reason of
                normal ->
                    ok;
                _Other ->
                    start_server()
            end
    end.

