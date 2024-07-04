// SPDX-License-Identifier: Apache-2.0
pragma solidity 0.8.26;

import {Test, console} from "forge-std/Test.sol";
import {Caller} from "../src/Caller.sol";
import {Terminus} from "../src/Terminus.sol";

contract CounterTest is Test {
    Caller private _caller;
    Terminus private _terminus;

    function setUp() public {
        _terminus = new Terminus();
        _caller = new Caller();
    }

    function test_revert_callValue() public {

        //TODO
    }
}
