// SPDX-License-Identifier: Apache-2.0
pragma solidity 0.8.26;

import {Test, console} from "forge-std/Test.sol";
import {TerminusRevert} from "../src/TerminusRevert.sol";
import {TerminusRevertByRequire} from "../src/TerminusRevertByRequire.sol";

contract AddressCallRevert is Test {

    // When the call operation on address reverts, the revert does not propagate (bubble up)
    function test_receive_revert_callValue() public {
        TerminusRevert terminus = new TerminusRevert();
        bytes memory expectedError = abi.encodeWithSignature("Error(string)", "Receive: Ether not accepted");

        (bool success, bytes memory result) = address(terminus).call{value: 100 gwei}("");

        assertFalse(success, "Call should fail");
        assertEq(result, expectedError, "Error string mismatch");
    }

    // When the call operation on address reverts, the revert does not propagate (bubble up)
    function test_fallback_revert_callValue() public {
        TerminusRevert terminus = new TerminusRevert();
        bytes memory expectedError = abi.encodeWithSignature("Error(string)", "Fallback: Ether not accepted");

        (bool success, bytes memory result) = address(terminus).call{value: 100 gwei}("By geeves Worcester!");

        assertFalse(success, "Call should fail");
        assertEq(result, expectedError, "Error string mismatch");
    }

    // When the call operation on address reverts, the revert does not propagate (bubble up)
    function test_receive_revertByRequire_callValue() public {
        TerminusRevertByRequire terminus = new TerminusRevertByRequire();
        bytes memory expectedError = abi.encodeWithSignature("Error(string)", "Receive: Ether not accepted");

        (bool success, bytes memory result) = address(terminus).call{value: 100 gwei}("");

        assertFalse(success, "Call should fail");
        assertEq(result, expectedError, "Error string mismatch");
    }

    // When the call operation on address reverts, the revert does not propagate (bubble up)
    function test_fallback_revertByRequire_callValue() public {
        TerminusRevertByRequire terminus = new TerminusRevertByRequire();
        bytes memory expectedError = abi.encodeWithSignature("Error(string)", "Fallback: Ether not accepted");

        (bool success, bytes memory result) = address(terminus).call("it's the wrong function Grommit!");

        assertFalse(success, "Call should fail");
        assertEq(result, expectedError, "Error string mismatch");
    }
}
