// SPDX-License-Identifier: MIT
pragma solidity >=0.8.24;

/* Autogenerated file. Do not edit manually. */

// Import store internals
import { IStore } from "@latticexyz/store/src/IStore.sol";
import { StoreSwitch } from "@latticexyz/store/src/StoreSwitch.sol";
import { StoreCore } from "@latticexyz/store/src/StoreCore.sol";
import { Bytes } from "@latticexyz/store/src/Bytes.sol";
import { Memory } from "@latticexyz/store/src/Memory.sol";
import { SliceLib } from "@latticexyz/store/src/Slice.sol";
import { EncodeArray } from "@latticexyz/store/src/tightcoder/EncodeArray.sol";
import { FieldLayout } from "@latticexyz/store/src/FieldLayout.sol";
import { Schema } from "@latticexyz/store/src/Schema.sol";
import { PackedCounter, PackedCounterLib } from "@latticexyz/store/src/PackedCounter.sol";
import { ResourceId } from "@latticexyz/store/src/ResourceId.sol";

// Import user types
import { Enum2, Enum1 } from "./../common.sol";

struct StaticsData {
  uint256 v1;
  int32 v2;
  bytes16 v3;
  address v4;
  bool v5;
  Enum1 v6;
}

library Statics {
  // Hex below is the result of `WorldResourceIdLib.encode({ namespace: "", name: "Statics", typeId: RESOURCE_TABLE });`
  ResourceId constant _tableId = ResourceId.wrap(0x7462000000000000000000000000000053746174696373000000000000000000);

  FieldLayout constant _fieldLayout =
    FieldLayout.wrap(0x004a060020041014010100000000000000000000000000000000000000000000);

  // Hex-encoded key schema of (uint256, int32, bytes16, address, bool, uint8)
  Schema constant _keySchema = Schema.wrap(0x004a06001f234f61600000000000000000000000000000000000000000000000);
  // Hex-encoded value schema of (uint256, int32, bytes16, address, bool, uint8)
  Schema constant _valueSchema = Schema.wrap(0x004a06001f234f61600000000000000000000000000000000000000000000000);

  /**
   * @notice Get the table's key field names.
   * @return keyNames An array of strings with the names of key fields.
   */
  function getKeyNames() internal pure returns (string[] memory keyNames) {
    keyNames = new string[](6);
    keyNames[0] = "k1";
    keyNames[1] = "k2";
    keyNames[2] = "k3";
    keyNames[3] = "k4";
    keyNames[4] = "k5";
    keyNames[5] = "k6";
  }

  /**
   * @notice Get the table's value field names.
   * @return fieldNames An array of strings with the names of value fields.
   */
  function getFieldNames() internal pure returns (string[] memory fieldNames) {
    fieldNames = new string[](6);
    fieldNames[0] = "v1";
    fieldNames[1] = "v2";
    fieldNames[2] = "v3";
    fieldNames[3] = "v4";
    fieldNames[4] = "v5";
    fieldNames[5] = "v6";
  }

  /**
   * @notice Register the table with its config.
   */
  function register() internal {
    StoreSwitch.registerTable(_tableId, _fieldLayout, _keySchema, _valueSchema, getKeyNames(), getFieldNames());
  }

  /**
   * @notice Register the table with its config.
   */
  function _register() internal {
    StoreCore.registerTable(_tableId, _fieldLayout, _keySchema, _valueSchema, getKeyNames(), getFieldNames());
  }

  /**
   * @notice Get v1.
   */
  function getV1(uint256 k1, int32 k2, bytes16 k3, address k4, bool k5, Enum2 k6) internal view returns (uint256 v1) {
    bytes32[] memory _keyTuple = new bytes32[](6);
    _keyTuple[0] = bytes32(uint256(k1));
    _keyTuple[1] = bytes32(uint256(int256(k2)));
    _keyTuple[2] = bytes32(k3);
    _keyTuple[3] = bytes32(uint256(uint160(k4)));
    _keyTuple[4] = _boolToBytes32(k5);
    _keyTuple[5] = bytes32(uint256(uint8(k6)));

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 0, _fieldLayout);
    return (uint256(bytes32(_blob)));
  }

  /**
   * @notice Get v1.
   */
  function _getV1(uint256 k1, int32 k2, bytes16 k3, address k4, bool k5, Enum2 k6) internal view returns (uint256 v1) {
    bytes32[] memory _keyTuple = new bytes32[](6);
    _keyTuple[0] = bytes32(uint256(k1));
    _keyTuple[1] = bytes32(uint256(int256(k2)));
    _keyTuple[2] = bytes32(k3);
    _keyTuple[3] = bytes32(uint256(uint160(k4)));
    _keyTuple[4] = _boolToBytes32(k5);
    _keyTuple[5] = bytes32(uint256(uint8(k6)));

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 0, _fieldLayout);
    return (uint256(bytes32(_blob)));
  }

  /**
   * @notice Set v1.
   */
  function setV1(uint256 k1, int32 k2, bytes16 k3, address k4, bool k5, Enum2 k6, uint256 v1) internal {
    bytes32[] memory _keyTuple = new bytes32[](6);
    _keyTuple[0] = bytes32(uint256(k1));
    _keyTuple[1] = bytes32(uint256(int256(k2)));
    _keyTuple[2] = bytes32(k3);
    _keyTuple[3] = bytes32(uint256(uint160(k4)));
    _keyTuple[4] = _boolToBytes32(k5);
    _keyTuple[5] = bytes32(uint256(uint8(k6)));

    StoreSwitch.setStaticField(_tableId, _keyTuple, 0, abi.encodePacked((v1)), _fieldLayout);
  }

  /**
   * @notice Set v1.
   */
  function _setV1(uint256 k1, int32 k2, bytes16 k3, address k4, bool k5, Enum2 k6, uint256 v1) internal {
    bytes32[] memory _keyTuple = new bytes32[](6);
    _keyTuple[0] = bytes32(uint256(k1));
    _keyTuple[1] = bytes32(uint256(int256(k2)));
    _keyTuple[2] = bytes32(k3);
    _keyTuple[3] = bytes32(uint256(uint160(k4)));
    _keyTuple[4] = _boolToBytes32(k5);
    _keyTuple[5] = bytes32(uint256(uint8(k6)));

    StoreCore.setStaticField(_tableId, _keyTuple, 0, abi.encodePacked((v1)), _fieldLayout);
  }

  /**
   * @notice Get v2.
   */
  function getV2(uint256 k1, int32 k2, bytes16 k3, address k4, bool k5, Enum2 k6) internal view returns (int32 v2) {
    bytes32[] memory _keyTuple = new bytes32[](6);
    _keyTuple[0] = bytes32(uint256(k1));
    _keyTuple[1] = bytes32(uint256(int256(k2)));
    _keyTuple[2] = bytes32(k3);
    _keyTuple[3] = bytes32(uint256(uint160(k4)));
    _keyTuple[4] = _boolToBytes32(k5);
    _keyTuple[5] = bytes32(uint256(uint8(k6)));

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 1, _fieldLayout);
    return (int32(uint32(bytes4(_blob))));
  }

  /**
   * @notice Get v2.
   */
  function _getV2(uint256 k1, int32 k2, bytes16 k3, address k4, bool k5, Enum2 k6) internal view returns (int32 v2) {
    bytes32[] memory _keyTuple = new bytes32[](6);
    _keyTuple[0] = bytes32(uint256(k1));
    _keyTuple[1] = bytes32(uint256(int256(k2)));
    _keyTuple[2] = bytes32(k3);
    _keyTuple[3] = bytes32(uint256(uint160(k4)));
    _keyTuple[4] = _boolToBytes32(k5);
    _keyTuple[5] = bytes32(uint256(uint8(k6)));

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 1, _fieldLayout);
    return (int32(uint32(bytes4(_blob))));
  }

  /**
   * @notice Set v2.
   */
  function setV2(uint256 k1, int32 k2, bytes16 k3, address k4, bool k5, Enum2 k6, int32 v2) internal {
    bytes32[] memory _keyTuple = new bytes32[](6);
    _keyTuple[0] = bytes32(uint256(k1));
    _keyTuple[1] = bytes32(uint256(int256(k2)));
    _keyTuple[2] = bytes32(k3);
    _keyTuple[3] = bytes32(uint256(uint160(k4)));
    _keyTuple[4] = _boolToBytes32(k5);
    _keyTuple[5] = bytes32(uint256(uint8(k6)));

    StoreSwitch.setStaticField(_tableId, _keyTuple, 1, abi.encodePacked((v2)), _fieldLayout);
  }

  /**
   * @notice Set v2.
   */
  function _setV2(uint256 k1, int32 k2, bytes16 k3, address k4, bool k5, Enum2 k6, int32 v2) internal {
    bytes32[] memory _keyTuple = new bytes32[](6);
    _keyTuple[0] = bytes32(uint256(k1));
    _keyTuple[1] = bytes32(uint256(int256(k2)));
    _keyTuple[2] = bytes32(k3);
    _keyTuple[3] = bytes32(uint256(uint160(k4)));
    _keyTuple[4] = _boolToBytes32(k5);
    _keyTuple[5] = bytes32(uint256(uint8(k6)));

    StoreCore.setStaticField(_tableId, _keyTuple, 1, abi.encodePacked((v2)), _fieldLayout);
  }

  /**
   * @notice Get v3.
   */
  function getV3(uint256 k1, int32 k2, bytes16 k3, address k4, bool k5, Enum2 k6) internal view returns (bytes16 v3) {
    bytes32[] memory _keyTuple = new bytes32[](6);
    _keyTuple[0] = bytes32(uint256(k1));
    _keyTuple[1] = bytes32(uint256(int256(k2)));
    _keyTuple[2] = bytes32(k3);
    _keyTuple[3] = bytes32(uint256(uint160(k4)));
    _keyTuple[4] = _boolToBytes32(k5);
    _keyTuple[5] = bytes32(uint256(uint8(k6)));

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 2, _fieldLayout);
    return (bytes16(_blob));
  }

  /**
   * @notice Get v3.
   */
  function _getV3(uint256 k1, int32 k2, bytes16 k3, address k4, bool k5, Enum2 k6) internal view returns (bytes16 v3) {
    bytes32[] memory _keyTuple = new bytes32[](6);
    _keyTuple[0] = bytes32(uint256(k1));
    _keyTuple[1] = bytes32(uint256(int256(k2)));
    _keyTuple[2] = bytes32(k3);
    _keyTuple[3] = bytes32(uint256(uint160(k4)));
    _keyTuple[4] = _boolToBytes32(k5);
    _keyTuple[5] = bytes32(uint256(uint8(k6)));

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 2, _fieldLayout);
    return (bytes16(_blob));
  }

  /**
   * @notice Set v3.
   */
  function setV3(uint256 k1, int32 k2, bytes16 k3, address k4, bool k5, Enum2 k6, bytes16 v3) internal {
    bytes32[] memory _keyTuple = new bytes32[](6);
    _keyTuple[0] = bytes32(uint256(k1));
    _keyTuple[1] = bytes32(uint256(int256(k2)));
    _keyTuple[2] = bytes32(k3);
    _keyTuple[3] = bytes32(uint256(uint160(k4)));
    _keyTuple[4] = _boolToBytes32(k5);
    _keyTuple[5] = bytes32(uint256(uint8(k6)));

    StoreSwitch.setStaticField(_tableId, _keyTuple, 2, abi.encodePacked((v3)), _fieldLayout);
  }

  /**
   * @notice Set v3.
   */
  function _setV3(uint256 k1, int32 k2, bytes16 k3, address k4, bool k5, Enum2 k6, bytes16 v3) internal {
    bytes32[] memory _keyTuple = new bytes32[](6);
    _keyTuple[0] = bytes32(uint256(k1));
    _keyTuple[1] = bytes32(uint256(int256(k2)));
    _keyTuple[2] = bytes32(k3);
    _keyTuple[3] = bytes32(uint256(uint160(k4)));
    _keyTuple[4] = _boolToBytes32(k5);
    _keyTuple[5] = bytes32(uint256(uint8(k6)));

    StoreCore.setStaticField(_tableId, _keyTuple, 2, abi.encodePacked((v3)), _fieldLayout);
  }

  /**
   * @notice Get v4.
   */
  function getV4(uint256 k1, int32 k2, bytes16 k3, address k4, bool k5, Enum2 k6) internal view returns (address v4) {
    bytes32[] memory _keyTuple = new bytes32[](6);
    _keyTuple[0] = bytes32(uint256(k1));
    _keyTuple[1] = bytes32(uint256(int256(k2)));
    _keyTuple[2] = bytes32(k3);
    _keyTuple[3] = bytes32(uint256(uint160(k4)));
    _keyTuple[4] = _boolToBytes32(k5);
    _keyTuple[5] = bytes32(uint256(uint8(k6)));

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 3, _fieldLayout);
    return (address(bytes20(_blob)));
  }

  /**
   * @notice Get v4.
   */
  function _getV4(uint256 k1, int32 k2, bytes16 k3, address k4, bool k5, Enum2 k6) internal view returns (address v4) {
    bytes32[] memory _keyTuple = new bytes32[](6);
    _keyTuple[0] = bytes32(uint256(k1));
    _keyTuple[1] = bytes32(uint256(int256(k2)));
    _keyTuple[2] = bytes32(k3);
    _keyTuple[3] = bytes32(uint256(uint160(k4)));
    _keyTuple[4] = _boolToBytes32(k5);
    _keyTuple[5] = bytes32(uint256(uint8(k6)));

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 3, _fieldLayout);
    return (address(bytes20(_blob)));
  }

  /**
   * @notice Set v4.
   */
  function setV4(uint256 k1, int32 k2, bytes16 k3, address k4, bool k5, Enum2 k6, address v4) internal {
    bytes32[] memory _keyTuple = new bytes32[](6);
    _keyTuple[0] = bytes32(uint256(k1));
    _keyTuple[1] = bytes32(uint256(int256(k2)));
    _keyTuple[2] = bytes32(k3);
    _keyTuple[3] = bytes32(uint256(uint160(k4)));
    _keyTuple[4] = _boolToBytes32(k5);
    _keyTuple[5] = bytes32(uint256(uint8(k6)));

    StoreSwitch.setStaticField(_tableId, _keyTuple, 3, abi.encodePacked((v4)), _fieldLayout);
  }

  /**
   * @notice Set v4.
   */
  function _setV4(uint256 k1, int32 k2, bytes16 k3, address k4, bool k5, Enum2 k6, address v4) internal {
    bytes32[] memory _keyTuple = new bytes32[](6);
    _keyTuple[0] = bytes32(uint256(k1));
    _keyTuple[1] = bytes32(uint256(int256(k2)));
    _keyTuple[2] = bytes32(k3);
    _keyTuple[3] = bytes32(uint256(uint160(k4)));
    _keyTuple[4] = _boolToBytes32(k5);
    _keyTuple[5] = bytes32(uint256(uint8(k6)));

    StoreCore.setStaticField(_tableId, _keyTuple, 3, abi.encodePacked((v4)), _fieldLayout);
  }

  /**
   * @notice Get v5.
   */
  function getV5(uint256 k1, int32 k2, bytes16 k3, address k4, bool k5, Enum2 k6) internal view returns (bool v5) {
    bytes32[] memory _keyTuple = new bytes32[](6);
    _keyTuple[0] = bytes32(uint256(k1));
    _keyTuple[1] = bytes32(uint256(int256(k2)));
    _keyTuple[2] = bytes32(k3);
    _keyTuple[3] = bytes32(uint256(uint160(k4)));
    _keyTuple[4] = _boolToBytes32(k5);
    _keyTuple[5] = bytes32(uint256(uint8(k6)));

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 4, _fieldLayout);
    return (_toBool(uint8(bytes1(_blob))));
  }

  /**
   * @notice Get v5.
   */
  function _getV5(uint256 k1, int32 k2, bytes16 k3, address k4, bool k5, Enum2 k6) internal view returns (bool v5) {
    bytes32[] memory _keyTuple = new bytes32[](6);
    _keyTuple[0] = bytes32(uint256(k1));
    _keyTuple[1] = bytes32(uint256(int256(k2)));
    _keyTuple[2] = bytes32(k3);
    _keyTuple[3] = bytes32(uint256(uint160(k4)));
    _keyTuple[4] = _boolToBytes32(k5);
    _keyTuple[5] = bytes32(uint256(uint8(k6)));

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 4, _fieldLayout);
    return (_toBool(uint8(bytes1(_blob))));
  }

  /**
   * @notice Set v5.
   */
  function setV5(uint256 k1, int32 k2, bytes16 k3, address k4, bool k5, Enum2 k6, bool v5) internal {
    bytes32[] memory _keyTuple = new bytes32[](6);
    _keyTuple[0] = bytes32(uint256(k1));
    _keyTuple[1] = bytes32(uint256(int256(k2)));
    _keyTuple[2] = bytes32(k3);
    _keyTuple[3] = bytes32(uint256(uint160(k4)));
    _keyTuple[4] = _boolToBytes32(k5);
    _keyTuple[5] = bytes32(uint256(uint8(k6)));

    StoreSwitch.setStaticField(_tableId, _keyTuple, 4, abi.encodePacked((v5)), _fieldLayout);
  }

  /**
   * @notice Set v5.
   */
  function _setV5(uint256 k1, int32 k2, bytes16 k3, address k4, bool k5, Enum2 k6, bool v5) internal {
    bytes32[] memory _keyTuple = new bytes32[](6);
    _keyTuple[0] = bytes32(uint256(k1));
    _keyTuple[1] = bytes32(uint256(int256(k2)));
    _keyTuple[2] = bytes32(k3);
    _keyTuple[3] = bytes32(uint256(uint160(k4)));
    _keyTuple[4] = _boolToBytes32(k5);
    _keyTuple[5] = bytes32(uint256(uint8(k6)));

    StoreCore.setStaticField(_tableId, _keyTuple, 4, abi.encodePacked((v5)), _fieldLayout);
  }

  /**
   * @notice Get v6.
   */
  function getV6(uint256 k1, int32 k2, bytes16 k3, address k4, bool k5, Enum2 k6) internal view returns (Enum1 v6) {
    bytes32[] memory _keyTuple = new bytes32[](6);
    _keyTuple[0] = bytes32(uint256(k1));
    _keyTuple[1] = bytes32(uint256(int256(k2)));
    _keyTuple[2] = bytes32(k3);
    _keyTuple[3] = bytes32(uint256(uint160(k4)));
    _keyTuple[4] = _boolToBytes32(k5);
    _keyTuple[5] = bytes32(uint256(uint8(k6)));

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 5, _fieldLayout);
    return Enum1(uint8(bytes1(_blob)));
  }

  /**
   * @notice Get v6.
   */
  function _getV6(uint256 k1, int32 k2, bytes16 k3, address k4, bool k5, Enum2 k6) internal view returns (Enum1 v6) {
    bytes32[] memory _keyTuple = new bytes32[](6);
    _keyTuple[0] = bytes32(uint256(k1));
    _keyTuple[1] = bytes32(uint256(int256(k2)));
    _keyTuple[2] = bytes32(k3);
    _keyTuple[3] = bytes32(uint256(uint160(k4)));
    _keyTuple[4] = _boolToBytes32(k5);
    _keyTuple[5] = bytes32(uint256(uint8(k6)));

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 5, _fieldLayout);
    return Enum1(uint8(bytes1(_blob)));
  }

  /**
   * @notice Set v6.
   */
  function setV6(uint256 k1, int32 k2, bytes16 k3, address k4, bool k5, Enum2 k6, Enum1 v6) internal {
    bytes32[] memory _keyTuple = new bytes32[](6);
    _keyTuple[0] = bytes32(uint256(k1));
    _keyTuple[1] = bytes32(uint256(int256(k2)));
    _keyTuple[2] = bytes32(k3);
    _keyTuple[3] = bytes32(uint256(uint160(k4)));
    _keyTuple[4] = _boolToBytes32(k5);
    _keyTuple[5] = bytes32(uint256(uint8(k6)));

    StoreSwitch.setStaticField(_tableId, _keyTuple, 5, abi.encodePacked(uint8(v6)), _fieldLayout);
  }

  /**
   * @notice Set v6.
   */
  function _setV6(uint256 k1, int32 k2, bytes16 k3, address k4, bool k5, Enum2 k6, Enum1 v6) internal {
    bytes32[] memory _keyTuple = new bytes32[](6);
    _keyTuple[0] = bytes32(uint256(k1));
    _keyTuple[1] = bytes32(uint256(int256(k2)));
    _keyTuple[2] = bytes32(k3);
    _keyTuple[3] = bytes32(uint256(uint160(k4)));
    _keyTuple[4] = _boolToBytes32(k5);
    _keyTuple[5] = bytes32(uint256(uint8(k6)));

    StoreCore.setStaticField(_tableId, _keyTuple, 5, abi.encodePacked(uint8(v6)), _fieldLayout);
  }

  /**
   * @notice Get the full data.
   */
  function get(
    uint256 k1,
    int32 k2,
    bytes16 k3,
    address k4,
    bool k5,
    Enum2 k6
  ) internal view returns (StaticsData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](6);
    _keyTuple[0] = bytes32(uint256(k1));
    _keyTuple[1] = bytes32(uint256(int256(k2)));
    _keyTuple[2] = bytes32(k3);
    _keyTuple[3] = bytes32(uint256(uint160(k4)));
    _keyTuple[4] = _boolToBytes32(k5);
    _keyTuple[5] = bytes32(uint256(uint8(k6)));

    (bytes memory _staticData, PackedCounter _encodedLengths, bytes memory _dynamicData) = StoreSwitch.getRecord(
      _tableId,
      _keyTuple,
      _fieldLayout
    );
    return decode(_staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Get the full data.
   */
  function _get(
    uint256 k1,
    int32 k2,
    bytes16 k3,
    address k4,
    bool k5,
    Enum2 k6
  ) internal view returns (StaticsData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](6);
    _keyTuple[0] = bytes32(uint256(k1));
    _keyTuple[1] = bytes32(uint256(int256(k2)));
    _keyTuple[2] = bytes32(k3);
    _keyTuple[3] = bytes32(uint256(uint160(k4)));
    _keyTuple[4] = _boolToBytes32(k5);
    _keyTuple[5] = bytes32(uint256(uint8(k6)));

    (bytes memory _staticData, PackedCounter _encodedLengths, bytes memory _dynamicData) = StoreCore.getRecord(
      _tableId,
      _keyTuple,
      _fieldLayout
    );
    return decode(_staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Set the full data using individual values.
   */
  function set(
    uint256 k1,
    int32 k2,
    bytes16 k3,
    address k4,
    bool k5,
    Enum2 k6,
    uint256 v1,
    int32 v2,
    bytes16 v3,
    address v4,
    bool v5,
    Enum1 v6
  ) internal {
    bytes memory _staticData = encodeStatic(v1, v2, v3, v4, v5, v6);

    PackedCounter _encodedLengths;
    bytes memory _dynamicData;

    bytes32[] memory _keyTuple = new bytes32[](6);
    _keyTuple[0] = bytes32(uint256(k1));
    _keyTuple[1] = bytes32(uint256(int256(k2)));
    _keyTuple[2] = bytes32(k3);
    _keyTuple[3] = bytes32(uint256(uint160(k4)));
    _keyTuple[4] = _boolToBytes32(k5);
    _keyTuple[5] = bytes32(uint256(uint8(k6)));

    StoreSwitch.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Set the full data using individual values.
   */
  function _set(
    uint256 k1,
    int32 k2,
    bytes16 k3,
    address k4,
    bool k5,
    Enum2 k6,
    uint256 v1,
    int32 v2,
    bytes16 v3,
    address v4,
    bool v5,
    Enum1 v6
  ) internal {
    bytes memory _staticData = encodeStatic(v1, v2, v3, v4, v5, v6);

    PackedCounter _encodedLengths;
    bytes memory _dynamicData;

    bytes32[] memory _keyTuple = new bytes32[](6);
    _keyTuple[0] = bytes32(uint256(k1));
    _keyTuple[1] = bytes32(uint256(int256(k2)));
    _keyTuple[2] = bytes32(k3);
    _keyTuple[3] = bytes32(uint256(uint160(k4)));
    _keyTuple[4] = _boolToBytes32(k5);
    _keyTuple[5] = bytes32(uint256(uint8(k6)));

    StoreCore.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData, _fieldLayout);
  }

  /**
   * @notice Set the full data using the data struct.
   */
  function set(uint256 k1, int32 k2, bytes16 k3, address k4, bool k5, Enum2 k6, StaticsData memory _table) internal {
    bytes memory _staticData = encodeStatic(_table.v1, _table.v2, _table.v3, _table.v4, _table.v5, _table.v6);

    PackedCounter _encodedLengths;
    bytes memory _dynamicData;

    bytes32[] memory _keyTuple = new bytes32[](6);
    _keyTuple[0] = bytes32(uint256(k1));
    _keyTuple[1] = bytes32(uint256(int256(k2)));
    _keyTuple[2] = bytes32(k3);
    _keyTuple[3] = bytes32(uint256(uint160(k4)));
    _keyTuple[4] = _boolToBytes32(k5);
    _keyTuple[5] = bytes32(uint256(uint8(k6)));

    StoreSwitch.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Set the full data using the data struct.
   */
  function _set(uint256 k1, int32 k2, bytes16 k3, address k4, bool k5, Enum2 k6, StaticsData memory _table) internal {
    bytes memory _staticData = encodeStatic(_table.v1, _table.v2, _table.v3, _table.v4, _table.v5, _table.v6);

    PackedCounter _encodedLengths;
    bytes memory _dynamicData;

    bytes32[] memory _keyTuple = new bytes32[](6);
    _keyTuple[0] = bytes32(uint256(k1));
    _keyTuple[1] = bytes32(uint256(int256(k2)));
    _keyTuple[2] = bytes32(k3);
    _keyTuple[3] = bytes32(uint256(uint160(k4)));
    _keyTuple[4] = _boolToBytes32(k5);
    _keyTuple[5] = bytes32(uint256(uint8(k6)));

    StoreCore.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData, _fieldLayout);
  }

  /**
   * @notice Decode the tightly packed blob of static data using this table's field layout.
   */
  function decodeStatic(
    bytes memory _blob
  ) internal pure returns (uint256 v1, int32 v2, bytes16 v3, address v4, bool v5, Enum1 v6) {
    v1 = (uint256(Bytes.slice32(_blob, 0)));

    v2 = (int32(uint32(Bytes.slice4(_blob, 32))));

    v3 = (Bytes.slice16(_blob, 36));

    v4 = (address(Bytes.slice20(_blob, 52)));

    v5 = (_toBool(uint8(Bytes.slice1(_blob, 72))));

    v6 = Enum1(uint8(Bytes.slice1(_blob, 73)));
  }

  /**
   * @notice Decode the tightly packed blobs using this table's field layout.
   * @param _staticData Tightly packed static fields.
   *
   *
   */
  function decode(
    bytes memory _staticData,
    PackedCounter,
    bytes memory
  ) internal pure returns (StaticsData memory _table) {
    (_table.v1, _table.v2, _table.v3, _table.v4, _table.v5, _table.v6) = decodeStatic(_staticData);
  }

  /**
   * @notice Delete all data for given keys.
   */
  function deleteRecord(uint256 k1, int32 k2, bytes16 k3, address k4, bool k5, Enum2 k6) internal {
    bytes32[] memory _keyTuple = new bytes32[](6);
    _keyTuple[0] = bytes32(uint256(k1));
    _keyTuple[1] = bytes32(uint256(int256(k2)));
    _keyTuple[2] = bytes32(k3);
    _keyTuple[3] = bytes32(uint256(uint160(k4)));
    _keyTuple[4] = _boolToBytes32(k5);
    _keyTuple[5] = bytes32(uint256(uint8(k6)));

    StoreSwitch.deleteRecord(_tableId, _keyTuple);
  }

  /**
   * @notice Delete all data for given keys.
   */
  function _deleteRecord(uint256 k1, int32 k2, bytes16 k3, address k4, bool k5, Enum2 k6) internal {
    bytes32[] memory _keyTuple = new bytes32[](6);
    _keyTuple[0] = bytes32(uint256(k1));
    _keyTuple[1] = bytes32(uint256(int256(k2)));
    _keyTuple[2] = bytes32(k3);
    _keyTuple[3] = bytes32(uint256(uint160(k4)));
    _keyTuple[4] = _boolToBytes32(k5);
    _keyTuple[5] = bytes32(uint256(uint8(k6)));

    StoreCore.deleteRecord(_tableId, _keyTuple, _fieldLayout);
  }

  /**
   * @notice Tightly pack static (fixed length) data using this table's schema.
   * @return The static data, encoded into a sequence of bytes.
   */
  function encodeStatic(
    uint256 v1,
    int32 v2,
    bytes16 v3,
    address v4,
    bool v5,
    Enum1 v6
  ) internal pure returns (bytes memory) {
    return abi.encodePacked(v1, v2, v3, v4, v5, v6);
  }

  /**
   * @notice Encode all of a record's fields.
   * @return The static (fixed length) data, encoded into a sequence of bytes.
   * @return The lengths of the dynamic fields (packed into a single bytes32 value).
   * @return The dynamic (variable length) data, encoded into a sequence of bytes.
   */
  function encode(
    uint256 v1,
    int32 v2,
    bytes16 v3,
    address v4,
    bool v5,
    Enum1 v6
  ) internal pure returns (bytes memory, PackedCounter, bytes memory) {
    bytes memory _staticData = encodeStatic(v1, v2, v3, v4, v5, v6);

    PackedCounter _encodedLengths;
    bytes memory _dynamicData;

    return (_staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Encode keys as a bytes32 array using this table's field layout.
   */
  function encodeKeyTuple(
    uint256 k1,
    int32 k2,
    bytes16 k3,
    address k4,
    bool k5,
    Enum2 k6
  ) internal pure returns (bytes32[] memory) {
    bytes32[] memory _keyTuple = new bytes32[](6);
    _keyTuple[0] = bytes32(uint256(k1));
    _keyTuple[1] = bytes32(uint256(int256(k2)));
    _keyTuple[2] = bytes32(k3);
    _keyTuple[3] = bytes32(uint256(uint160(k4)));
    _keyTuple[4] = _boolToBytes32(k5);
    _keyTuple[5] = bytes32(uint256(uint8(k6)));

    return _keyTuple;
  }
}

/**
 * @notice Cast a value to a bool.
 * @dev Boolean values are encoded as uint8 (1 = true, 0 = false), but Solidity doesn't allow casting between uint8 and bool.
 * @param value The uint8 value to convert.
 * @return result The boolean value.
 */
function _toBool(uint8 value) pure returns (bool result) {
  assembly {
    result := value
  }
}

/**
 * @notice Cast a bool to a bytes32.
 * @dev The boolean value is casted to a bytes32 value with 0 or 1 at the least significant bit.
 */
function _boolToBytes32(bool value) pure returns (bytes32 result) {
  assembly {
    result := value
  }
}
