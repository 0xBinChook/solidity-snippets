// SPDX-License-Identifier: Apache-2.0
pragma solidity 0.8.26;

import {Test, console} from "forge-std/Test.sol";
import {Caller} from "../src/Caller.sol";
import {RevertingTerminus} from "../src/RevertingTerminus.sol";

contract CounterTest is Test {

    function test_revert_callValue() public {
        Caller caller = new Caller(new RevertingTerminus());
        bytes memory expectedError = abi.encodeWithSignature("Error(string)", "Receive: Ether not accepted");

        (bool success, bytes memory result) = caller.callReceive();

        assertFalse(success, "Call should fail");
        assertEq(result, expectedError, "Error string mismatch");
    }
}
