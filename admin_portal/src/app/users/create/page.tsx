"use client";

import { Create, useCheckboxGroup, useForm, useSelect } from "@refinedev/antd";
import { supabaseClient } from "@utility/supabase-client";
import { Checkbox, Form, Input, Select } from "antd";
import { useRouter } from "next/navigation";
import { useState } from "react";

export default function UserCreate() {
  const router = useRouter();
  const [userRole, setUserRole] = useState<String>("student");
  const { formProps, saveButtonProps, onFinish } = useForm({});

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

  const { checkboxGroupProps } = useCheckboxGroup({
    resource: "classes",
    optionLabel: "display_name",
    optionValue: "id",
  });

  const handleOnFinish = async (values: any) => {
    const { data, error } = await supabaseClient.auth.signUp({
      email: values.email,
      password: 'abcd1234',
    });

    if (error) {
      console.log(error.message);
      return;
    }

    const userId = data.user?.id;
    const classId: string = values.class_id;
    const teacherClassIds: string[] = values.teacher_class_ids;

    if (userRole === 'student') delete values.class_id;
    if (userRole === 'teacher') delete values.teacher_class_ids;

    await onFinish({ ...values, id: userId, display_name: values.first_name + values.last_name });

    if (userRole === 'student') {
      await supabaseClient.from("users_classes").insert({
        "class_id": classId,
        "user_id": userId,
      });
    }
    else if (userRole === 'teacher') {
      const promises = teacherClassIds.map(id =>
        supabaseClient.
          from("users_classes")
          .insert({
            "class_id": id,
            "user_id": userId,
          }));
      await Promise.all(promises);
    }

    router.push("/users");
  }

  return (
    <Create saveButtonProps={saveButtonProps}>
      <Form {...formProps} layout="vertical" onFinish={handleOnFinish} >
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
            onChange={(v) => setUserRole(v)}
          />
        </Form.Item>
        {userRole === "student" && (
          <Form.Item
            label={"Parent"}
            name={"parent_id"}
          >
            <Select {...relationSelectProps} />
          </Form.Item>
        )}
        {userRole === "student" && (
          <Form.Item
            label={"Class"}
            name={"class_id"}
          >
            <Select {...classSelectProps} />
          </Form.Item>
        )}
        {userRole === 'teacher' && (
          <Form.Item
            label="Classes"
            name="teacher_class_ids"
          >
            <Checkbox.Group {...checkboxGroupProps} />
          </Form.Item>
        )}
      </Form>
    </Create>
  );
}
