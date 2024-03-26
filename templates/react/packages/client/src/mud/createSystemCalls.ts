/*
 * Create the system calls that the client can use to ask
 * for changes in the World state (using the System contracts).
 */

import { type Hex } from "viem";
import { type Network } from "./setupNetwork";
import { type WorldContract } from "./wallet/createBurner";

export type SystemCalls = ReturnType<typeof createSystemCalls>;

export function createSystemCalls(
  /*
   * `tables`, `useStore`, and `waitForTransaction` are from `syncToZustand()`.
   * `worldContract` is from `getContract()`.
   */
  { tables, useStore, waitForTransaction }: Network,
  worldContract: WorldContract,
) {
  const addTask = async (label: string) => {
    const tx = await worldContract.write.addTask([label]);
    await waitForTransaction(tx);
  };

  const toggleTask = async (id: Hex) => {
    const isComplete = (useStore.getState().getValue(tables.Tasks, { id })?.completedAt ?? 0n) > 0n;
    const tx = isComplete ? await worldContract.write.resetTask([id]) : await worldContract.write.completeTask([id]);
    await waitForTransaction(tx);
  };

  const deleteTask = async (id: Hex) => {
    const tx = await worldContract.write.deleteTask([id]);
    await waitForTransaction(tx);
  };

  return {
    addTask,
    toggleTask,
    deleteTask,
  };
}
