%%%-------------------------------------------------------------------
%% @doc example public API
%% @end
%%%-------------------------------------------------------------------

-module(example_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    % NB lager:info is only available when you add -compile([{parse_transform, lager_transform}]).
    %    to a module or {erl_opts, [{parse_transform, lager_transform}]}. to rebar.config.
    %    otherwise you have to use the generic lager api, e.g., lager:log(info, self(), "start"),
    lager:info("Begin"),
    ClientVersion = io_lib:format("erlang/~s", [erlang:system_info(otp_release)]),
    Url = io_lib:format("https://example.com:8888?~s", [uri_string:compose_query([{"example-client", ClientVersion}])]),
    {ok, {{_Version, 200, _ReasonPhrase}, _Headers, Body}} = httpc:request(get, {Url, []}, [], []),
    lager:info("tls-dump-clienthello response: ~s", [Body]),
    % since this is an example application that is suppossed to terminate
    % after calling the service, we do just that after 100 milliseconds.
    timer:apply_after(100, init, stop, []),
    example_sup:start_link().

stop(_State) ->
    lager:info("End"),
    ok.

%% internal functions
