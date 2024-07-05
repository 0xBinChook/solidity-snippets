// SPDX-License-Identifier: Apache-2.0
pragma solidity 0.8.26;

import {RevertingTerminus} from "./RevertingTerminus.sol";

contract Caller {
    RevertingTerminus private _endpoint;

    constructor(RevertingTerminus endpoint){
        _endpoint = endpoint;
    }

    // Calls the Terminus with the given msg.value, without any msg.data
    function callReceive() external payable returns (bool success, bytes memory result){
        (success, result) = address(_endpoint).call{value: msg.value}("");
    }
}
