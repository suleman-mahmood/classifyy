"use client";

import { Create, useCheckboxGroup, useForm } from "@refinedev/antd";
import { supabaseClient } from "@utility/supabase-client";
import { Checkbox, Form, Input } from "antd";
import { useRouter } from "next/navigation";
import { v4 as uuidv4 } from "uuid";

export default function ClassCreate() {
  const router = useRouter()
  const { formProps, saveButtonProps, onFinish } = useForm({redirect: false});
  const { checkboxGroupProps } = useCheckboxGroup({
    resource: "users",
    optionLabel: "display_name",
    optionValue: "id",
    filters: [
      {
        field: "user_role",
        operator: "eq",
        value: "teacher",
      }
    ],
  });

  const handleOnFinish = async (values: any) => {
    console.log(values);
    const id  = uuidv4();
    const teachers = values.teachers;
    delete values.teachers
    await onFinish({ ...values, id: id });

    const promises = teachers.map((t: string) => {
      return supabaseClient.from("users_classes").insert({
        "class_id": id,
        "user_id": t,
      });
    });

    await Promise.all(promises);
    router.push("/classes");
  }

  return (
    <Create saveButtonProps={saveButtonProps}>
      <Form {...formProps} layout="vertical" onFinish={handleOnFinish}>
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
        <Form.Item label="Teachers" name="teachers">
          <Checkbox.Group {...checkboxGroupProps} />
        </Form.Item>
      </Form>
    </Create>
  );
}
