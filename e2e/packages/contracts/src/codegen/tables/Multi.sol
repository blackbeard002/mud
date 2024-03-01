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

struct MultiData {
  int256 num;
  bool value;
}

library Multi {
  // Hex below is the result of `WorldResourceIdLib.encode({ namespace: "", name: "Multi", typeId: RESOURCE_TABLE });`
  ResourceId constant _tableId = ResourceId.wrap(0x746200000000000000000000000000004d756c74690000000000000000000000);

  FieldLayout constant _fieldLayout =
    FieldLayout.wrap(0x0021020020010000000000000000000000000000000000000000000000000000);

  // Hex-encoded key schema of (uint32, bool, uint256, int120)
  Schema constant _keySchema = Schema.wrap(0x0034040003601f2e000000000000000000000000000000000000000000000000);
  // Hex-encoded value schema of (int256, bool)
  Schema constant _valueSchema = Schema.wrap(0x002102003f600000000000000000000000000000000000000000000000000000);

  /**
   * @notice Get the table's key field names.
   * @return keyNames An array of strings with the names of key fields.
   */
  function getKeyNames() internal pure returns (string[] memory keyNames) {
    keyNames = new string[](4);
    keyNames[0] = "a";
    keyNames[1] = "b";
    keyNames[2] = "c";
    keyNames[3] = "d";
  }

  /**
   * @notice Get the table's value field names.
   * @return fieldNames An array of strings with the names of value fields.
   */
  function getFieldNames() internal pure returns (string[] memory fieldNames) {
    fieldNames = new string[](2);
    fieldNames[0] = "num";
    fieldNames[1] = "value";
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
   * @notice Get num.
   */
  function getNum(uint32 a, bool b, uint256 c, int120 d) internal view returns (int256 num) {
    bytes32[] memory _keyTuple = new bytes32[](4);
    _keyTuple[0] = bytes32(uint256(a));
    _keyTuple[1] = _boolToBytes32(b);
    _keyTuple[2] = bytes32(uint256(c));
    _keyTuple[3] = bytes32(uint256(int256(d)));

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 0, _fieldLayout);
    return (int256(uint256(bytes32(_blob))));
  }

  /**
   * @notice Get num.
   */
  function _getNum(uint32 a, bool b, uint256 c, int120 d) internal view returns (int256 num) {
    bytes32[] memory _keyTuple = new bytes32[](4);
    _keyTuple[0] = bytes32(uint256(a));
    _keyTuple[1] = _boolToBytes32(b);
    _keyTuple[2] = bytes32(uint256(c));
    _keyTuple[3] = bytes32(uint256(int256(d)));

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 0, _fieldLayout);
    return (int256(uint256(bytes32(_blob))));
  }

  /**
   * @notice Set num.
   */
  function setNum(uint32 a, bool b, uint256 c, int120 d, int256 num) internal {
    bytes32[] memory _keyTuple = new bytes32[](4);
    _keyTuple[0] = bytes32(uint256(a));
    _keyTuple[1] = _boolToBytes32(b);
    _keyTuple[2] = bytes32(uint256(c));
    _keyTuple[3] = bytes32(uint256(int256(d)));

    StoreSwitch.setStaticField(_tableId, _keyTuple, 0, abi.encodePacked((num)), _fieldLayout);
  }

  /**
   * @notice Set num.
   */
  function _setNum(uint32 a, bool b, uint256 c, int120 d, int256 num) internal {
    bytes32[] memory _keyTuple = new bytes32[](4);
    _keyTuple[0] = bytes32(uint256(a));
    _keyTuple[1] = _boolToBytes32(b);
    _keyTuple[2] = bytes32(uint256(c));
    _keyTuple[3] = bytes32(uint256(int256(d)));

    StoreCore.setStaticField(_tableId, _keyTuple, 0, abi.encodePacked((num)), _fieldLayout);
  }

  /**
   * @notice Get value.
   */
  function getValue(uint32 a, bool b, uint256 c, int120 d) internal view returns (bool value) {
    bytes32[] memory _keyTuple = new bytes32[](4);
    _keyTuple[0] = bytes32(uint256(a));
    _keyTuple[1] = _boolToBytes32(b);
    _keyTuple[2] = bytes32(uint256(c));
    _keyTuple[3] = bytes32(uint256(int256(d)));

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 1, _fieldLayout);
    return (_toBool(uint8(bytes1(_blob))));
  }

  /**
   * @notice Get value.
   */
  function _getValue(uint32 a, bool b, uint256 c, int120 d) internal view returns (bool value) {
    bytes32[] memory _keyTuple = new bytes32[](4);
    _keyTuple[0] = bytes32(uint256(a));
    _keyTuple[1] = _boolToBytes32(b);
    _keyTuple[2] = bytes32(uint256(c));
    _keyTuple[3] = bytes32(uint256(int256(d)));

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 1, _fieldLayout);
    return (_toBool(uint8(bytes1(_blob))));
  }

  /**
   * @notice Set value.
   */
  function setValue(uint32 a, bool b, uint256 c, int120 d, bool value) internal {
    bytes32[] memory _keyTuple = new bytes32[](4);
    _keyTuple[0] = bytes32(uint256(a));
    _keyTuple[1] = _boolToBytes32(b);
    _keyTuple[2] = bytes32(uint256(c));
    _keyTuple[3] = bytes32(uint256(int256(d)));

    StoreSwitch.setStaticField(_tableId, _keyTuple, 1, abi.encodePacked((value)), _fieldLayout);
  }

  /**
   * @notice Set value.
   */
  function _setValue(uint32 a, bool b, uint256 c, int120 d, bool value) internal {
    bytes32[] memory _keyTuple = new bytes32[](4);
    _keyTuple[0] = bytes32(uint256(a));
    _keyTuple[1] = _boolToBytes32(b);
    _keyTuple[2] = bytes32(uint256(c));
    _keyTuple[3] = bytes32(uint256(int256(d)));

    StoreCore.setStaticField(_tableId, _keyTuple, 1, abi.encodePacked((value)), _fieldLayout);
  }

  /**
   * @notice Get the full data.
   */
  function get(uint32 a, bool b, uint256 c, int120 d) internal view returns (MultiData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](4);
    _keyTuple[0] = bytes32(uint256(a));
    _keyTuple[1] = _boolToBytes32(b);
    _keyTuple[2] = bytes32(uint256(c));
    _keyTuple[3] = bytes32(uint256(int256(d)));

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
  function _get(uint32 a, bool b, uint256 c, int120 d) internal view returns (MultiData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](4);
    _keyTuple[0] = bytes32(uint256(a));
    _keyTuple[1] = _boolToBytes32(b);
    _keyTuple[2] = bytes32(uint256(c));
    _keyTuple[3] = bytes32(uint256(int256(d)));

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
  function set(uint32 a, bool b, uint256 c, int120 d, int256 num, bool value) internal {
    bytes memory _staticData = encodeStatic(num, value);

    PackedCounter _encodedLengths;
    bytes memory _dynamicData;

    bytes32[] memory _keyTuple = new bytes32[](4);
    _keyTuple[0] = bytes32(uint256(a));
    _keyTuple[1] = _boolToBytes32(b);
    _keyTuple[2] = bytes32(uint256(c));
    _keyTuple[3] = bytes32(uint256(int256(d)));

    StoreSwitch.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Set the full data using individual values.
   */
  function _set(uint32 a, bool b, uint256 c, int120 d, int256 num, bool value) internal {
    bytes memory _staticData = encodeStatic(num, value);

    PackedCounter _encodedLengths;
    bytes memory _dynamicData;

    bytes32[] memory _keyTuple = new bytes32[](4);
    _keyTuple[0] = bytes32(uint256(a));
    _keyTuple[1] = _boolToBytes32(b);
    _keyTuple[2] = bytes32(uint256(c));
    _keyTuple[3] = bytes32(uint256(int256(d)));

    StoreCore.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData, _fieldLayout);
  }

  /**
   * @notice Set the full data using the data struct.
   */
  function set(uint32 a, bool b, uint256 c, int120 d, MultiData memory _table) internal {
    bytes memory _staticData = encodeStatic(_table.num, _table.value);

    PackedCounter _encodedLengths;
    bytes memory _dynamicData;

    bytes32[] memory _keyTuple = new bytes32[](4);
    _keyTuple[0] = bytes32(uint256(a));
    _keyTuple[1] = _boolToBytes32(b);
    _keyTuple[2] = bytes32(uint256(c));
    _keyTuple[3] = bytes32(uint256(int256(d)));

    StoreSwitch.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Set the full data using the data struct.
   */
  function _set(uint32 a, bool b, uint256 c, int120 d, MultiData memory _table) internal {
    bytes memory _staticData = encodeStatic(_table.num, _table.value);

    PackedCounter _encodedLengths;
    bytes memory _dynamicData;

    bytes32[] memory _keyTuple = new bytes32[](4);
    _keyTuple[0] = bytes32(uint256(a));
    _keyTuple[1] = _boolToBytes32(b);
    _keyTuple[2] = bytes32(uint256(c));
    _keyTuple[3] = bytes32(uint256(int256(d)));

    StoreCore.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData, _fieldLayout);
  }

  /**
   * @notice Decode the tightly packed blob of static data using this table's field layout.
   */
  function decodeStatic(bytes memory _blob) internal pure returns (int256 num, bool value) {
    num = (int256(uint256(Bytes.slice32(_blob, 0))));

    value = (_toBool(uint8(Bytes.slice1(_blob, 32))));
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
  ) internal pure returns (MultiData memory _table) {
    (_table.num, _table.value) = decodeStatic(_staticData);
  }

  /**
   * @notice Delete all data for given keys.
   */
  function deleteRecord(uint32 a, bool b, uint256 c, int120 d) internal {
    bytes32[] memory _keyTuple = new bytes32[](4);
    _keyTuple[0] = bytes32(uint256(a));
    _keyTuple[1] = _boolToBytes32(b);
    _keyTuple[2] = bytes32(uint256(c));
    _keyTuple[3] = bytes32(uint256(int256(d)));

    StoreSwitch.deleteRecord(_tableId, _keyTuple);
  }

  /**
   * @notice Delete all data for given keys.
   */
  function _deleteRecord(uint32 a, bool b, uint256 c, int120 d) internal {
    bytes32[] memory _keyTuple = new bytes32[](4);
    _keyTuple[0] = bytes32(uint256(a));
    _keyTuple[1] = _boolToBytes32(b);
    _keyTuple[2] = bytes32(uint256(c));
    _keyTuple[3] = bytes32(uint256(int256(d)));

    StoreCore.deleteRecord(_tableId, _keyTuple, _fieldLayout);
  }

  /**
   * @notice Tightly pack static (fixed length) data using this table's schema.
   * @return The static data, encoded into a sequence of bytes.
   */
  function encodeStatic(int256 num, bool value) internal pure returns (bytes memory) {
    return abi.encodePacked(num, value);
  }

  /**
   * @notice Encode all of a record's fields.
   * @return The static (fixed length) data, encoded into a sequence of bytes.
   * @return The lengths of the dynamic fields (packed into a single bytes32 value).
   * @return The dynamic (variable length) data, encoded into a sequence of bytes.
   */
  function encode(int256 num, bool value) internal pure returns (bytes memory, PackedCounter, bytes memory) {
    bytes memory _staticData = encodeStatic(num, value);

    PackedCounter _encodedLengths;
    bytes memory _dynamicData;

    return (_staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Encode keys as a bytes32 array using this table's field layout.
   */
  function encodeKeyTuple(uint32 a, bool b, uint256 c, int120 d) internal pure returns (bytes32[] memory) {
    bytes32[] memory _keyTuple = new bytes32[](4);
    _keyTuple[0] = bytes32(uint256(a));
    _keyTuple[1] = _boolToBytes32(b);
    _keyTuple[2] = bytes32(uint256(c));
    _keyTuple[3] = bytes32(uint256(int256(d)));

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
