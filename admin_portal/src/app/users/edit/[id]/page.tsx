"use client";

import { Edit, useForm, useSelect } from "@refinedev/antd";
import { Form, Input, Select } from "antd";

export default function BlogPostEdit() {
  const { formProps, saveButtonProps } = useForm({});

  const { selectProps: relationSelectProps } = useSelect({
    resource: "users",
    optionLabel: "display_name",
    optionValue: "id",
    filters: [
      {
        field: "user_role",
        operator: "eq",
        value: "parent",
      }
    ],
    // meta: "",
  });

  return (
    <Edit saveButtonProps={saveButtonProps}>
      <Form {...formProps} layout="vertical">
        <Form.Item
          label={"Email"}
          name={["email"]}
          rules={[
            {
              required: true,
            },
          ]}
        >
          <Input />
        </Form.Item>
        <Form.Item
          label={"Phone Number"}
          name={["phone_number"]}
          rules={[
            {
              required: true,
            },
          ]}
        >
          <Input />
        </Form.Item>
        <Form.Item
          label={"Display Name"}
          name={["display_name"]}
          rules={[
            {
              required: true,
            },
          ]}
        >
          <Input />
        </Form.Item>
        <Form.Item
          label={"First Name"}
          name={["first_name"]}
          rules={[
            {
              required: true,
            },
          ]}
        >
          <Input />
        </Form.Item>
        <Form.Item
          label={"Last Name"}
          name={["last_name"]}
          rules={[
            {
              required: true,
            },
          ]}
        >
          <Input />
        </Form.Item>
        <Form.Item
          label={"User Role"}
          name={["user_role"]}
          initialValue={"student"}
          rules={[
            {
              required: true,
            },
          ]}
        >
          <Select
            defaultValue={"student"}
            options={[
              { value: "student", label: "Student" },
              { value: "parent", label: "Parent" },
              { value: "teacher", label: "Teacher" },
            ]}
            style={{ width: 120 }}
          />
        </Form.Item>
        <Form.Item
          label={"Relationship"}
          name={"parent_id"}
          rules={[
            {
              required: true,
            },
          ]}
        >
          <Select {...relationSelectProps} />
        </Form.Item>
      </Form>
    </Edit>
  );
}
