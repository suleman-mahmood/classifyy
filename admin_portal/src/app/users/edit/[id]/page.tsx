"use client";

import { Edit, useForm, useSelect } from "@refinedev/antd";
import { supabaseClient } from "@utility/supabase-client";
import { Form, Input, Select } from "antd";
import { useRouter } from "next/navigation";

export default function UserEdit() {
  const router = useRouter()
  const { formProps, saveButtonProps, queryResult, onFinish } = useForm({ redirect: false, meta: {
    select: ("*, classes(id) as class_id"),
  } });

  const userRole = queryResult?.data?.data.user_role;
  const userId = queryResult?.data?.data.id;
  const classId = queryResult?.data?.data.classes[0].id;

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
  });

  const { selectProps: classSelectProps } = useSelect({
    resource: "classes",
    optionLabel: "display_name",
    optionValue: "id",
  });

  const handleOnFinish = async (values: any) => {
    const classId = values.class_id;
    delete values.class_id
    await onFinish({ ...values });

    await supabaseClient.from("users_classes").delete().eq("user_id", userId);
    await supabaseClient.from("users_classes").insert({
      "class_id": classId,
      "user_id": userId,
    });

    router.push("/users");
  }

  return (
    <Edit saveButtonProps={saveButtonProps}>
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
        {userRole === "student" && (
          <Form.Item
            label={"Parent"}
            name={"parent_id"}
            rules={[
              {
                required: true,
              },
            ]}
          >
            <Select {...relationSelectProps} />
          </Form.Item>
        )}
        {userRole === "student" && (
          <Form.Item
            label={"Class"}
            name={"class_id"}
            rules={[
              {
                required: true,
              },
            ]}
          >
            <Select {...classSelectProps} defaultValue={classId} />
          </Form.Item>
        )}
      </Form>
    </Edit>
  );
}
