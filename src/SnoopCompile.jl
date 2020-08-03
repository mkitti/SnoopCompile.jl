module SnoopCompile

using SnoopCompileCore
export @snoopc

using SnoopCompileAnalysis

# needed for processing the output of snoopc (avoids a breaking change in scoping)
using SnoopCompileAnalysis: parcel, read, write, parse_call, format_userimg

if isdefined(SnoopCompileCore, Symbol("@snoopi"))
    export @snoopi
    using SnoopCompileAnalysis: topmodule, lookup_kwbody_ex, exclusions_remover!
end

if isdefined(SnoopCompileCore, Symbol("@snoopr"))
    export @snoopr, uinvalidated, invalidation_trees, filtermod, findcaller, ascend
    using SnoopCompileAnalysis: getroot, remove_if_not_eval!
end

using SnoopCompileBot
export BotConfig, snoop_bot, snoop_bench
export timesum, pathof_noload, GoodPath
if isdefined(SnoopCompileBot, Symbol("@snoopiBench"))
    # deprecated names
    export @snoopiBench, @snoopiBot, @snoopi_bench, @snoopi_bot
end
using SnoopCompileBot: standardize_osname, JuliaVersionNumber, addtestdep

end # module