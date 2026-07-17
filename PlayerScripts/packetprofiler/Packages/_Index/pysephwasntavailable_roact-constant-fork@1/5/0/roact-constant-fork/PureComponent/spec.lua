-- Decompiled with Potassium's decompiler.

return function() -- Line: 1
    local createElement = require(script.Parent.createElement);
    local NoopRenderer = require(script.Parent.NoopRenderer);
    local createReconciler = require(script.Parent.createReconciler);
    local PureComponent = require(script.Parent.PureComponent);
    local u1 = createReconciler(NoopRenderer);
    it("should be extendable", function() -- Line: 10
        -- upvalues: PureComponent (copy)
        local v2 = PureComponent:extend("MyComponent");
        expect(v2).to.be.ok();
    end);
    it("should skip updates for shallow-equal props", function() -- Line: 16
        -- upvalues: PureComponent (copy), createElement (copy), u1 (copy)
        local u3 = 0;
        local u4 = nil;
        local u5 = PureComponent:extend("PureChild");

        function u5.willUpdate(p6) -- Line: 22
            -- upvalues: u3 (ref)
            u3 = u3 + 1;
        end;

        function u5.render(p7) -- Line: 26
            return nil;
        end;

        local v8 = PureComponent:extend("PureContainer");

        function v8.init(p9) -- Line: 32
            p9.state = {
                value = 0
            };
        end;

        function v8.didMount(u10) -- Line: 38
            -- upvalues: u4 (ref)
            u4 = function(p11) -- Line: 39
                -- upvalues: u10 (copy)
                u10:setState({
                    value = p11
                });
            end;
        end;

        function v8.render(p12) -- Line: 46
            -- upvalues: createElement (ref), u5 (copy)
            return createElement(u5, {
                value = p12.state.value
            });
        end;

        local v13 = createElement(v8);
        local v14 = u1.mountVirtualTree(v13, nil, "PureComponent Tree");
        expect(u3).to.equal(0);
        u4(1);
        expect(u3).to.equal(1);
        u4(1);
        expect(u3).to.equal(1);
        u4(2);
        expect(u3).to.equal(2);
        u4(1);
        expect(u3).to.equal(3);
        u1.unmountVirtualTree(v14);
    end);
end;