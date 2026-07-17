-- Decompiled with Potassium's decompiler.

return function() -- Line: 1
    local createElement = require(script.Parent.Parent.createElement);
    local createReconciler = require(script.Parent.Parent.createReconciler);
    local createSpy = require(script.Parent.Parent.createSpy);
    local None = require(script.Parent.Parent.None);
    local NoopRenderer = require(script.Parent.Parent.NoopRenderer);
    local Component = require(script.Parent.Parent.Component);
    local u1 = createReconciler(NoopRenderer);
    describe("setState", function() -- Line: 12
        -- upvalues: Component (copy), createElement (copy), u1 (copy), None (copy)
        it("should not trigger an extra update when called in init", function() -- Line: 13
            -- upvalues: Component (ref), createElement (ref), u1 (ref)
            local u2 = 0;
            local u3 = 0;
            local u4 = nil;
            local v5 = Component:extend("InitComponent");

            function v5.init(p6) -- Line: 20
                p6:setState({
                    a = 1
                });
            end;

            function v5.willUpdate(p7) -- Line: 26
                -- upvalues: u3 (ref)
                u3 = u3 + 1;
            end;

            function v5.render(p8) -- Line: 30
                -- upvalues: u2 (ref), u4 (ref)
                u2 = u2 + 1;
                u4 = p8.state;

                return nil;
            end;

            local v9 = createElement(v5);
            u1.mountVirtualTree(v9);
            expect(u2).to.equal(1);
            expect(u3).to.equal(0);
            expect(u4.a).to.equal(1);
        end);
        it("should throw when called in render", function() -- Line: 45
            -- upvalues: Component (ref), createElement (ref), u1 (ref)
            local v10 = Component:extend("TestComponent");

            function v10.render(p11) -- Line: 48
                p11:setState({
                    a = 1
                });
            end;

            local v12 = createElement(v10);
            local success, result = pcall(u1.mountVirtualTree, v12);
            expect(success).to.equal(false);
            expect(result:match("render")).to.be.ok();
            expect(result:match("TestComponent")).to.be.ok();
        end);
        it("should throw when called in shouldUpdate", function() -- Line: 63
            -- upvalues: Component (ref), createElement (ref), u1 (ref)
            local v13 = Component:extend("TestComponent");

            function v13.render(p14) -- Line: 66
                return nil;
            end;

            function v13.shouldUpdate(p15) -- Line: 70
                p15:setState({
                    a = 1
                });
            end;

            local v16 = createElement(v13);
            local v17 = createElement(v13);
            local v18 = u1.mountVirtualTree(v16);
            local success, result = pcall(u1.updateVirtualTree, v18, v17);
            expect(success).to.equal(false);
            expect(result:match("shouldUpdate")).to.be.ok();
            expect(result:match("TestComponent")).to.be.ok();
        end);
        it("should throw when called in willUpdate", function() -- Line: 88
            -- upvalues: Component (ref), createElement (ref), u1 (ref)
            local v19 = Component:extend("TestComponent");

            function v19.render(p20) -- Line: 91
                return nil;
            end;

            function v19.willUpdate(p21) -- Line: 95
                p21:setState({
                    a = 1
                });
            end;

            local v22 = createElement(v19);
            local v23 = createElement(v19);
            local v24 = u1.mountVirtualTree(v22);
            local success, result = pcall(u1.updateVirtualTree, v24, v23);
            expect(success).to.equal(false);
            expect(result:match("willUpdate")).to.be.ok();
            expect(result:match("TestComponent")).to.be.ok();
        end);
        it("should not throw when called in willUnmount", function() -- Line: 112
            -- upvalues: Component (ref), createElement (ref), u1 (ref)
            local v25 = Component:extend("TestComponent");

            function v25.render(p26) -- Line: 115
                return nil;
            end;

            function v25.willUnmount(p27) -- Line: 119
                p27:setState({
                    a = 1
                });
            end;

            local v28 = createElement(v25);
            local v29 = u1.mountVirtualTree(v28);
            local success, _ = pcall(u1.unmountVirtualTree, v29);
            expect(success).to.equal(true);
        end);
        it("should remove values from state when the value is None", function() -- Line: 133
            -- upvalues: Component (ref), createElement (ref), u1 (ref), None (ref)
            local v30 = Component:extend("TestComponent");
            local u31 = nil;
            local u32 = nil;

            function v30.init(u33) -- Line: 137
                -- upvalues: u31 (ref), u32 (ref)
                u31 = function(p34) -- Line: 138
                    -- upvalues: u33 (copy)
                    u33:setState(p34);
                end;

                u32 = function() -- Line: 142
                    -- upvalues: u33 (copy)
                    return u33.state;
                end;

                u33:setState({
                    value = 0
                });
            end;

            function v30.render(p35) -- Line: 151
                return nil;
            end;

            local v36 = createElement(v30);
            local v37 = u1.mountVirtualNode(v36, nil, "Test");
            expect(u32().value).to.equal(0);
            u31({
                value = None
            });
            expect(u32().value).to.equal(nil);
            u1.unmountVirtualNode(v37);
        end);
        it("should invoke functions to compute a partial state", function() -- Line: 169
            -- upvalues: Component (ref), createElement (ref), u1 (ref)
            local v38 = Component:extend("TestComponent");
            local u39 = nil;
            local u40 = nil;
            local u41 = nil;

            function v38.init(u42) -- Line: 173
                -- upvalues: u39 (ref), u40 (ref), u41 (ref)
                u39 = function(p43) -- Line: 174
                    -- upvalues: u42 (copy)
                    u42:setState(p43);
                end;

                u40 = function() -- Line: 178
                    -- upvalues: u42 (copy)
                    return u42.state;
                end;

                u41 = function() -- Line: 182
                    -- upvalues: u42 (copy)
                    return u42.props;
                end;

                u42:setState({
                    value = 0
                });
            end;

            function v38.render(p44) -- Line: 191
                return nil;
            end;

            local v45 = createElement(v38);
            local v46 = u1.mountVirtualNode(v45, nil, "Test");
            expect(u40().value).to.equal(0);
            u39(function(p47, p48) -- Line: 200
                -- upvalues: u40 (ref), u41 (ref)
                expect(p47).to.equal(u40());
                expect(p48).to.equal(u41());

                return {
                    value = p47.value + 1
                };
            end);
            expect(u40().value).to.equal(1);
            u1.unmountVirtualNode(v46);
        end);
        it("should cancel rendering if the function returns nil", function() -- Line: 214
            -- upvalues: Component (ref), createElement (ref), u1 (ref)
            local v49 = Component:extend("TestComponent");
            local u50 = nil;
            local u51 = 0;

            function v49.init(u52) -- Line: 219
                -- upvalues: u50 (ref)
                u50 = function(p53) -- Line: 220
                    -- upvalues: u52 (copy)
                    u52:setState(p53);
                end;

                u52:setState({
                    value = 0
                });
            end;

            function v49.render(p54) -- Line: 229
                -- upvalues: u51 (ref)
                u51 = u51 + 1;

                return nil;
            end;

            local v55 = createElement(v49);
            local v56 = u1.mountVirtualNode(v55, nil, "Test");
            expect(u51).to.equal(1);
            u50(function(p57, p58) -- Line: 238
                return nil;
            end);
            expect(u51).to.equal(1);
            u1.unmountVirtualNode(v56);
        end);
    end);
    describe("setState suspension", function() -- Line: 248
        -- upvalues: Component (copy), createElement (copy), u1 (copy), createSpy (copy)
        it("should defer setState triggered while reconciling", function() -- Line: 249
            -- upvalues: Component (ref), createElement (ref), u1 (ref)
            local u59 = Component:extend("Child");
            local u60 = nil;

            function u59.render(p61) -- Line: 253
                return nil;
            end;

            function u59.didMount(p62) -- Line: 257
                p62.props.callback();
            end;

            local v63 = Component:extend("Parent");

            function v63.init(u64) -- Line: 263
                -- upvalues: u60 (ref)
                u60 = function() -- Line: 264
                    -- upvalues: u64 (copy)
                    return u64.state;
                end;
            end;

            function v63.render(u65) -- Line: 269
                -- upvalues: createElement (ref), u59 (copy)
                return createElement(u59, {
                    callback = function() -- Line: 271, Name: callback
                        -- upvalues: u65 (copy)
                        u65:setState({
                            foo = "bar"
                        });
                    end
                });
            end;

            local v66 = createElement(v63);
            local v67 = u1.mountVirtualNode(v66, nil, "Test");
            expect(v67).to.be.ok();
            expect(u60().foo).to.equal("bar");
        end);
        it("should defer setState triggered while reconciling during an update", function() -- Line: 289
            -- upvalues: Component (ref), createElement (ref), u1 (ref)
            local u68 = Component:extend("Child");
            local u69 = nil;

            function u68.render(p70) -- Line: 293
                return nil;
            end;

            function u68.didUpdate(p71) -- Line: 297
                p71.props.callback();
            end;

            local v72 = Component:extend("Parent");

            function v72.init(u73) -- Line: 303
                -- upvalues: u69 (ref)
                u69 = function() -- Line: 304
                    -- upvalues: u73 (copy)
                    return u73.state;
                end;
            end;

            function v72.render(u74) -- Line: 309
                -- upvalues: createElement (ref), u68 (copy)
                return createElement(u68, {
                    callback = function() -- Line: 311, Name: callback
                        -- upvalues: u74 (copy)
                        if not u74.state.foo then
                            u74:setState({
                                foo = "bar"
                            });
                        end;
                    end
                });
            end;

            local v75 = createElement(v72);
            local v76 = u1.mountVirtualNode(v75, nil, "Test");
            expect(v76).to.be.ok();
            expect(u69().foo).to.equal(nil);
            local v77 = u1.updateVirtualNode(v76, createElement(v72));
            expect(v77).to.be.ok();
            expect(u69().foo).to.equal("bar");
            u1.unmountVirtualNode(v77);
        end);
        it("should combine pending state changes properly", function() -- Line: 339
            -- upvalues: Component (ref), createElement (ref), u1 (ref)
            local u78 = Component:extend("Child");
            local u79 = nil;

            function u78.render(p80) -- Line: 343
                return nil;
            end;

            function u78.didMount(p81) -- Line: 347
                p81.props.callback("foo", 1);
                p81.props.callback("bar", 3);
            end;

            local v82 = Component:extend("Parent");

            function v82.init(u83) -- Line: 354
                -- upvalues: u79 (ref)
                u79 = function() -- Line: 355
                    -- upvalues: u83 (copy)
                    return u83.state;
                end;
            end;

            function v82.render(u84) -- Line: 360
                -- upvalues: createElement (ref), u78 (copy)
                return createElement(u78, {
                    callback = function(p85, p86) -- Line: 362, Name: callback
                        -- upvalues: u84 (copy)
                        u84:setState({
                            [p85] = p86
                        });
                    end
                });
            end;

            local v87 = createElement(v82);
            local v88 = u1.mountVirtualNode(v87, nil, "Test");
            expect(v88).to.be.ok();
            expect(u79().foo).to.equal(1);
            expect(u79().bar).to.equal(3);
            u1.unmountVirtualNode(v88);
        end);
        it("should abort properly when functional setState returns nil while deferred", function() -- Line: 383
            -- upvalues: Component (ref), createSpy (ref), createElement (ref), u1 (ref)
            local u89 = Component:extend("Child");

            function u89.render(p90) -- Line: 386
                return nil;
            end;

            function u89.didMount(p91) -- Line: 390
                p91.props.callback();
            end;

            local v92 = Component:extend("Parent");
            local v94 = createSpy(function(u93) -- Line: 396
                -- upvalues: createElement (ref), u89 (copy)
                return createElement(u89, {
                    callback = function() -- Line: 398, Name: callback
                        -- upvalues: u93 (copy)
                        u93:setState(function() -- Line: 399
                            return nil;
                        end);
                    end
                });
            end);
            v92.render = v94.value;
            local v95 = createElement(v92);
            local v96 = u1.mountVirtualNode(v95, nil, "Test");
            expect(v96).to.be.ok();
            expect(v94.callCount).to.equal(1);
            u1.unmountVirtualNode(v96);
        end);
        it("should still apply pending state if a subsequent state update was aborted", function() -- Line: 421
            -- upvalues: Component (ref), createElement (ref), u1 (ref)
            local u97 = Component:extend("Child");
            local u98 = nil;

            function u97.render(p99) -- Line: 425
                return nil;
            end;

            function u97.didMount(p100) -- Line: 429
                p100.props.callback(function() -- Line: 430
                    return {
                        foo = 1
                    };
                end);
                p100.props.callback(function() -- Line: 435
                    return nil;
                end);
            end;

            local v101 = Component:extend("Parent");

            function v101.init(u102) -- Line: 442
                -- upvalues: u98 (ref)
                u98 = function() -- Line: 443
                    -- upvalues: u102 (copy)
                    return u102.state;
                end;
            end;

            function v101.render(u103) -- Line: 448
                -- upvalues: createElement (ref), u97 (copy)
                return createElement(u97, {
                    callback = function(p104) -- Line: 450, Name: callback
                        -- upvalues: u103 (copy)
                        u103:setState(p104);
                    end
                });
            end;

            local v105 = createElement(v101);
            local v106 = u1.mountVirtualNode(v105, nil, "Test");
            expect(v106).to.be.ok();
            expect(u98().foo).to.equal(1);
            u1.unmountVirtualNode(v106);
        end);
        it("should not re-process new state when pending state is present after update", function() -- Line: 468
            -- upvalues: Component (ref), createElement (ref), u1 (ref)
            local u107 = nil;
            local u108 = nil;
            local v109 = Component:extend("MyComponent");

            function v109.init(u110) -- Line: 474
                -- upvalues: u107 (ref), u108 (ref)
                u110:setState({
                    hasUpdatedOnce = false,
                    counter = 0
                });

                u107 = function(p111) -- Line: 480
                    -- upvalues: u110 (copy)
                    u110:setState(p111);
                end;

                u108 = function() -- Line: 484
                    -- upvalues: u110 (copy)
                    return u110.state;
                end;
            end;

            function v109.render(p112) -- Line: 489
                return nil;
            end;

            function v109.didUpdate(p113) -- Line: 493
                if p113.state.hasUpdatedOnce == false then
                    p113:setState({
                        hasUpdatedOnce = true
                    });
                end;
            end;

            local v114 = createElement(v109);
            u1.mountVirtualNode(v114, nil, "Test");
            expect(u108().hasUpdatedOnce).to.equal(false);
            expect(u108().counter).to.equal(0);
            u107(function(p115) -- Line: 510
                return {
                    counter = p115.counter + 1
                };
            end);
            expect(u108().hasUpdatedOnce).to.equal(true);
            expect(u108().counter).to.equal(1);
        end);
        it("should throw when an infinite update is triggered", function() -- Line: 520
            -- upvalues: Component (ref), createElement (ref), u1 (ref)
            local v116 = Component:extend("InfiniteUpdater");

            function v116.render(p117) -- Line: 523
                return nil;
            end;

            function v116.didMount(p118) -- Line: 527
                p118:setState({});
            end;

            function v116.didUpdate(p119) -- Line: 531
                p119:setState({});
            end;

            local v120 = createElement(v116);
            local success, result = pcall(u1.mountVirtualNode, v120, nil, "Test");
            expect(success).to.equal(false);
            expect(result:find("InfiniteUpdater")).to.be.ok();
            expect(result:find("reached the setState update recursion limit")).to.be.ok();
        end);
        itSKIP("should process single updates with both new and pending state", function() -- Line: 546
        end);
        it("should call trigger update after didMount when setting state in didMount", function() -- Line: 553
            -- upvalues: Component (ref), createElement (ref), u1 (ref)
            local v121 = Component:extend("MyComponent");

            function v121.init(p122) -- Line: 564
                p122:setState({
                    status = "initial mount"
                });
                p122.isMounted = false;
            end;

            function v121.render(p123) -- Line: 572
                return nil;
            end;

            function v121.didMount(p124) -- Line: 576
                p124:setState({
                    status = "mounted"
                });
                p124.isMounted = true;
            end;

            function v121.didUpdate(p125, p126, p127) -- Line: 584
                expect(p127.status).to.equal("initial mount");
                expect(p125.state.status).to.equal("mounted");
                expect(p125.isMounted).to.equal(true);
            end;

            local v128 = createElement(v121);
            local v129 = u1.mountVirtualNode(v128, nil, "Test");
            expect(v129).to.be.ok();
        end);
    end);
end;