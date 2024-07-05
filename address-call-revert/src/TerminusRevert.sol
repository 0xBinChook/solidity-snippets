// SPDX-License-Identifier: Apache-2.0
pragma solidity 0.8.26;

/*
 * Two default functions, both of which cause a revert when called.
 */
contract TerminusRevert {

    // Receive function is executed when the contract receives Ether without data
    // This function reverts any Ether sent to it
    receive() external payable {
        revert("Receive: Ether not accepted");
    }

    // Fallback function is executed when the contract receives Ether with data
    // or when a function that does not exist is called
    // This function reverts any Ether sent to it
    fallback() external payable {
        revert("Fallback: Ether not accepted");
    }
}
