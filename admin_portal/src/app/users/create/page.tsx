"use client";

import { Create, useForm } from "@refinedev/antd";
import { supabaseClient } from "@utility/supabase-client";
import { Form, Input, Select } from "antd";

export default function UserCreate() {
  const { formProps, saveButtonProps, onFinish } = useForm({});

  const handleOnFinish = async (values: any) => {
    const { data, error } = await supabaseClient.auth.signUp({
      email: values.email,
      password: 'abcd1234',
    });

    if (error) {
      console.log(error.message);
      return;
    }

    if (data) {
      const currentDate = new Date();
      await onFinish({ ...values, id: data.user?.id, created_at: currentDate });
    }
  }

  return (
    <Create saveButtonProps={saveButtonProps}>
      <Form {...formProps} layout="vertical" onFinish={handleOnFinish}>
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
      </Form>
    </Create>
  );
}
