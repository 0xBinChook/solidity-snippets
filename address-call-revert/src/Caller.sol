// SPDX-License-Identifier: Apache-2.0
pragma solidity 0.8.26;

import {Terminus} from "./Terminus.sol";

contract Caller {
    Terminus private _endpoint;

    constructor(Terminus endpoint){
        _endpoint = endpoint;
    }

    // Calls the Terminus with the given msg.value, without any msg.data
    function callReceive() external payable returns (bool success, bytes memory result){
        (success, result) = address(_endpoint).call{value: msg.value}("");
    }
}
