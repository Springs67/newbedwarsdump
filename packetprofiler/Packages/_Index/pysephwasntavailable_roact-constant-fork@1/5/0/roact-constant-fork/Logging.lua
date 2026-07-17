-- Decompiled with Potassium's decompiler.

local u1 = true;
local u2 = {};
local u3 = {};

local function indent(p4, p5) -- Line: 24
    local v6 = ("\t"):rep(p5);

    return v6 .. p4:gsub("\n", "\n" .. v6);
end;

local function indentLines(p7, p8) -- Line: 34
    local v9 = {};

    for _, v in ipairs(p7) do
        local v10 = ("\t"):rep(p8);
        local v11 = v10 .. v:gsub("\n", "\n" .. v10);
        table.insert(v9, v11);
    end;

    return table.concat(v9, "\n");
end;

local u17 = {
    __tostring = function(p12) -- Line: 50, Name: __tostring
        -- upvalues: indentLines (copy)
        local v13 = { "LogInfo {" };
        local v14 = #p12.errors;
        local v15 = #p12.warnings;
        local v16 = #p12.infos;

        if v14 + v15 + v16 == 0 then
            table.insert(v13, "\t(no messages)");
        end;

        if v14 > 0 then
            table.insert(v13, ("\tErrors (%d) {"):format(v14));
            table.insert(v13, indentLines(p12.errors, 2));
            table.insert(v13, "\t}");
        end;

        if v15 > 0 then
            table.insert(v13, ("\tWarnings (%d) {"):format(v15));
            table.insert(v13, indentLines(p12.warnings, 2));
            table.insert(v13, "\t}");
        end;

        if v16 > 0 then
            table.insert(v13, ("\tInfos (%d) {"):format(v16));
            table.insert(v13, indentLines(p12.infos, 2));
            table.insert(v13, "\t}");
        end;

        table.insert(v13, "}");

        return table.concat(v13, "\n");
    end
};

local function createLogInfo() -- Line: 84
    -- upvalues: u17 (copy)
    local v18 = {
        errors = {},
        warnings = {},
        infos = {}
    };
    setmetatable(v18, u17);

    return v18;
end;

local u27 = {
    capture = function(p19) -- Line: 105, Name: capture
        -- upvalues: createLogInfo (copy), u1 (ref), u2 (copy)
        local v20 = createLogInfo();
        local v21 = u1;
        u1 = false;
        u2[v20] = true;
        local success, result = pcall(p19);
        u2[v20] = nil;
        u1 = v21;
        assert(success, result);

        return v20;
    end,

    warn = function(p22, ...) -- Line: 125, Name: warn
        -- upvalues: u2 (copy), u1 (ref)
        local v23 = p22:format(...);

        for i in pairs(u2) do
            table.insert(i.warnings, v23);
        end;

        local v24 = debug.traceback("", 2):sub(2);
        local v25 = ("\t"):rep(1);
        local v26 = ("%s\n%s"):format(v23, v25 .. v24:gsub("\n", "\n" .. v25));

        if u1 then
            warn(v26);
        end;
    end
};

function u27.warnOnce(p28, ...) -- Line: 148
    -- upvalues: u3 (copy), u27 (copy)
    local v29 = debug.traceback();

    if u3[v29] then
        return;
    end;

    u3[v29] = true;
    u27.warn(p28, ...);
end;

return u27;