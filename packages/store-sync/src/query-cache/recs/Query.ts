import { Entity, QueryFragmentType } from "@latticexyz/recs";
import { QueryCacheStore } from "../createStore";
import { query } from "../query";
import { SchemaToPrimitives } from "@latticexyz/store";
import { hexKeyTupleToEntity } from "../../recs";
import { hexToResource } from "@latticexyz/common";
import { QuerySubjects, Tables, extractTables } from "../common";
import { SubjectRecords } from "@latticexyz/query";
import { Table } from "@latticexyz/store/config/v2";

type HasQueryFragment<table extends Table> = {
  type: QueryFragmentType.Has;
  table: table;
};

type NotQueryFragment<table extends Table> = {
  type: QueryFragmentType.Not;
  table: table;
};

type HasValueQueryFragment<table extends Table> = {
  type: QueryFragmentType.HasValue;
  table: table;
  value: SchemaToPrimitives<table["valueSchema"]>;
};

type NotValueQueryFragment<table extends Table> = {
  type: QueryFragmentType.NotValue;
  table: table;
  value: SchemaToPrimitives<table["valueSchema"]>;
};

type QueryFragment<table extends Table> =
  | HasQueryFragment<table>
  | NotQueryFragment<table>
  | HasValueQueryFragment<table>
  | NotValueQueryFragment<table>;

type QueryFragments<tables extends Tables> = QueryFragment<tables[keyof tables]>[];

export function Has<table extends Table>(table: table): HasQueryFragment<table> {
  return { type: QueryFragmentType.Has, table };
}

export function Not<table extends Table>(table: table): NotQueryFragment<table> {
  return { type: QueryFragmentType.Not, table };
}

export function HasValue<table extends Table>(
  table: table,
  value: SchemaToPrimitives<table["valueSchema"]>,
): HasValueQueryFragment<table> {
  return { type: QueryFragmentType.HasValue, table, value };
}

export function NotValue<table extends Table>(
  table: table,
  value: SchemaToPrimitives<table["valueSchema"]>,
): NotValueQueryFragment<table> {
  return { type: QueryFragmentType.NotValue, table, value };
}

function fragmentsToQuerySubjects(fragments: QueryFragment<Table>[]): QuerySubjects {
  const querySubjects: QuerySubjects = {};

  fragments.forEach((fragment) => {
    const { name } = hexToResource(fragment.table.tableId);
    querySubjects[name] = fragment.table.primaryKey;
  });

  return querySubjects;
}

function fragmentsToFrom(fragments: QueryFragment<Table>[]): QuerySubjects {
  return fragmentsToQuerySubjects(
    fragments.filter(
      (fragment) =>
        fragment.type === QueryFragmentType.Has ||
        fragment.type === QueryFragmentType.HasValue ||
        fragment.type === QueryFragmentType.NotValue,
    ),
  );
}

function fragmentsToExcept(fragments: QueryFragment<Table>[]): QuerySubjects {
  return fragmentsToQuerySubjects(fragments.filter((fragment) => fragment.type === QueryFragmentType.Not));
}

function fragmentToQueryConditions(fragment: QueryFragment<Table>): any[] {
  return Object.entries((fragment as HasValueQueryFragment<Table> | NotValueQueryFragment<Table>).value).map(
    ([field, right]) => {
      if (fragment.type === QueryFragmentType.HasValue) {
        return [`${hexToResource(fragment.table.tableId).name}.${field}`, "=", right];
      } else {
        return [`${hexToResource(fragment.table.tableId).name}.${field}`, "!=", right];
      }
    },
  ) as any[];
}

function fragmentsToWhere(fragments: QueryFragment<Table>[]): any[] {
  return fragments
    .filter((fragment) => fragment.type === QueryFragmentType.HasValue || fragment.type === QueryFragmentType.NotValue)
    .map(fragmentToQueryConditions)
    .flat();
}

function subjectToEntity(subject: SubjectRecords): Entity {
  // ECS uses the entire primary key, so all records for a given subject have the same key tuple
  return hexKeyTupleToEntity(subject.records[0].keyTuple);
}

export async function runQuery<store extends QueryCacheStore, fragments extends QueryFragments<extractTables<store>>>(
  store: store,
  fragments: fragments,
): Promise<Set<Entity>> {
  const from = fragmentsToFrom(fragments);
  const except = fragmentsToExcept(fragments);
  const where = fragmentsToWhere(fragments);

  const { subjects } = await query(store, { from, except, where });

  const entities = subjects.map(subjectToEntity);

  return new Set(entities);
}
