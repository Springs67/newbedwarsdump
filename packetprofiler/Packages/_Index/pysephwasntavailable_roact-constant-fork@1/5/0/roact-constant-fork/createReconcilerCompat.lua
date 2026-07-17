-- Decompiled with Potassium's decompiler.

local Logging = require(script.Parent.Logging);

return function(u1) -- Line: 23, Name: createReconcilerCompat
    -- upvalues: Logging (copy)
    return {
        reify = function(...) -- Line: 26, Name: reify
            -- upvalues: Logging (ref), u1 (copy)
            Logging.warnOnce("Roact.reify has been renamed to Roact.mount and will be removed in a future release.\nCheck the call to Roact.reify at:\n");

            return u1.mountVirtualTree(...);
        end,

        teardown = function(...) -- Line: 32, Name: teardown
            -- upvalues: Logging (ref), u1 (copy)
            Logging.warnOnce("Roact.teardown has been renamed to Roact.unmount and will be removed in a future release.\nCheck the call to Roact.teardown at:\n");

            return u1.unmountVirtualTree(...);
        end,

        reconcile = function(...) -- Line: 38, Name: reconcile
            -- upvalues: Logging (ref), u1 (copy)
            Logging.warnOnce("Roact.reconcile has been renamed to Roact.update and will be removed in a future release.\nCheck the call to Roact.reconcile at:\n");

            return u1.updateVirtualTree(...);
        end
    };
end;