// SPDX-License-Identifier: MIT
pragma solidity >=0.8.24;

import { ResourceId } from "@latticexyz/store/src/ResourceId.sol";
import { System } from "@latticexyz/world/src/System.sol";
import { createDelegation } from "@latticexyz/world/src/modules/init/implementations/createDelegation.sol";

import { UserDelegationNonces } from "./tables/UserDelegationNonces.sol";
import { getSignedMessageHash } from "./getSignedMessageHash.sol";
import { SignatureChecker } from "./SignatureChecker.sol";

contract Unstable_DelegationWithSignatureSystem is System {
  /**
   * @dev Invalid signature.
   */
  error InvalidSignature();

  /**
   * @notice Registers a delegation for `delegator` with a signature
   * @dev Creates a new delegation from the caller to the specified delegatee
   * @param delegatee The address of the delegatee
   * @param delegationControlId The ID controlling the delegation
   * @param initCallData The initialization data for the delegation
   * @param delegator The address of the delegator
   * @param signature The EIP712 signature
   */
  function registerDelegationWithSignature(
    address delegatee,
    ResourceId delegationControlId,
    bytes memory initCallData,
    address delegator,
    bytes memory signature
  ) public {
    uint256 nonce = UserDelegationNonces.get(delegator);
    bytes32 hash = getSignedMessageHash(delegatee, delegationControlId, initCallData, delegator, nonce, _world());

    if (!SignatureChecker.isValidSignatureNow(delegator, hash, signature)) {
      revert InvalidSignature();
    }

    UserDelegationNonces.set(delegator, nonce + 1);

    createDelegation(delegator, delegatee, delegationControlId, initCallData);
  }
}
