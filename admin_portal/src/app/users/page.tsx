"use client";

import {
  DateField,
  DeleteButton,
  EditButton,
  List,
  ShowButton,
  useTable,
} from "@refinedev/antd";
import { BaseRecord } from "@refinedev/core";
import { Space, Table } from "antd";

export default function UserList() {
  const { tableProps } = useTable({
    syncWithLocation: true,
    meta: {
      select: "*",
    },
  });

  return (
    <List>
      <Table {...tableProps} rowKey="id">
        <Table.Column dataIndex="email" title={"Email"} />
        <Table.Column dataIndex="first_name" title={"Fist Name"} />
        <Table.Column dataIndex="last_name" title={"Last Name"} />
        <Table.Column dataIndex="display_name" title={"Display Name"} />
        <Table.Column dataIndex="phone_number" title={"Phone Number"} />
        <Table.Column dataIndex="user_role" title={"User Role"} />
        <Table.Column
          dataIndex={["created_at"]}
          title={"Created at"}
          render={(value: any) => <DateField value={value} />}
        />
        <Table.Column
          title={"Actions"}
          dataIndex="actions"
          render={(_, record: BaseRecord) => (
            <Space>
              <EditButton hideText size="small" recordItemId={record.id} />
              <ShowButton hideText size="small" recordItemId={record.id} />
              <DeleteButton hideText size="small" recordItemId={record.id} />
            </Space>
          )}
        />
      </Table>
    </List>
  );
}
