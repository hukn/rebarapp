%% @author kangning.hu
%% @doc @todo Add description to rebarapp.


-module(rebarapp).

%% ====================================================================
%% API functions
%% ====================================================================
-export([start/0, stop/0]).

ensure_started(App) ->
    case application:start(App) of
        ok ->
            ok;
        {error, {already_started, App}} ->
            ok
    end.


%% @spec start() -> ok
%% @doc Start the emcs server.
start() ->
    rebarapp_deps:ensure(),
    ensure_started(crypto),
    application:start(rebarapp).


%% @spec stop() -> ok
%% @doc Stop the emcs server.
stop() ->
    application:stop(rebarapp).
