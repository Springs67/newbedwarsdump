-- Decompiled with Potassium's decompiler.

return function() -- Line: 1
    local assertDeepEqual = require(script.Parent.Parent.assertDeepEqual);
    local createElement = require(script.Parent.Parent.createElement);
    local createReconciler = require(script.Parent.Parent.createReconciler);
    local createSpy = require(script.Parent.Parent.createSpy);
    local NoopRenderer = require(script.Parent.Parent.NoopRenderer);
    local Type = require(script.Parent.Parent.Type);
    local Component = require(script.Parent.Parent.Component);
    local u1 = createReconciler(NoopRenderer);
    it("should be invoked when updated via updateVirtualNode", function() -- Line: 13
        -- upvalues: Component (copy), createSpy (copy), createElement (copy), u1 (copy), Type (copy), assertDeepEqual (copy)
        local v2 = Component:extend("MyComponent");
        local v3 = createSpy();
        v2.didUpdate = v3.value;

        function v2.render(p4) -- Line: 19
            return nil;
        end;

        local v5 = {
            a = 5
        };
        local v6 = createElement(v2, v5);
        local v7 = u1.mountVirtualNode(v6, nil, "Test");
        expect(v3.callCount).to.equal(0);
        local v8 = createElement(v2, {
            a = 6,
            b = 2
        });
        u1.updateVirtualNode(v7, v8);
        expect(v3.callCount).to.equal(1);
        local v9 = v3:captureValues("self", "oldProps", "oldState");
        expect(Type.of(v9.self)).to.equal(Type.StatefulComponentInstance);
        assertDeepEqual(v9.oldProps, v5);
        assertDeepEqual(v9.oldState, {});
    end);
    it("should be invoked when updated via setState", function() -- Line: 50
        -- upvalues: Component (copy), createSpy (copy), createElement (copy), u1 (copy), Type (copy), assertDeepEqual (copy)
        local v10 = Component:extend("MyComponent");
        local v11 = createSpy();
        v10.didUpdate = v11.value;
        local u12 = {
            a = 4
        };
        local u13 = nil;

        function v10.init(u14) -- Line: 61
            -- upvalues: u13 (ref), u12 (copy)
            u13 = function(...) -- Line: 62
                -- upvalues: u14 (copy)
                return u14:setState(...);
            end;

            u14:setState(u12);
        end;

        function v10.render(p15) -- Line: 69
        end;

        local v16 = createElement(v10);
        u1.mountVirtualNode(v16, nil, "Test");
        expect(v11.callCount).to.equal(0);
        u13({
            a = 5
        });
        expect(v11.callCount).to.equal(1);
        local v17 = v11:captureValues("self", "oldProps", "oldState");
        expect(Type.of(v17.self)).to.equal(Type.StatefulComponentInstance);
        assertDeepEqual(v17.oldProps, {});
        assertDeepEqual(v17.oldState, u12);
    end);
end;