"use client";

import { Edit, useCheckboxGroup, useForm, useSelect } from "@refinedev/antd";
import { supabaseClient } from "@utility/supabase-client";
import { Checkbox, Form, Input, Select } from "antd";
import { useRouter } from "next/navigation";
import { useEffect, useState } from "react";

export default function UserEdit() {
  const router = useRouter()
  const { formProps, saveButtonProps, queryResult, onFinish } = useForm({
    redirect: false,
    meta: {
      select: ("*, classes(id)"),
    },
  });
  const [userRole, setUserRole] = useState<String>("");

  useEffect(() => {
    setUserRole(queryResult?.data?.data.user_role);
  }, [queryResult]);

  let classId = '';
  if (queryResult?.data?.data.classes !== undefined && queryResult?.data?.data.classes.length > 0) {
    classId = queryResult?.data?.data.classes[0].id;
  }
  const teacherClassIds = queryResult?.data?.data.classes.map((c: any) => c.id);

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
    const userId = queryResult?.data?.data.id;
    const classId = values.class_id;
    const teacherClassIds: string[] = values.teacher_class_ids;

    if (userRole === 'student') delete values.class_id;
    if (userRole === 'teacher') delete values.teacher_class_ids;

    await onFinish({ ...values });

    await supabaseClient.from("users_classes").delete().eq("user_id", userId);

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
    <Edit saveButtonProps={saveButtonProps}>
      <Form {...formProps} layout="vertical" onFinish={handleOnFinish}>
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
          label={"User Role"}
          name={["user_role"]}
          rules={[
            {
              required: true,
            },
          ]}
        >
          <Select
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
            rules={[
              {
                required: true,
              },
            ]}
            initialValue={classId}
          >
            <Select {...classSelectProps} />
          </Form.Item>
        )}
        {userRole === 'teacher' && (
          <Form.Item
            label="Classes"
            name="teacher_class_ids"
            rules={[
              {
                required: true,
              },
            ]}
            initialValue={teacherClassIds}
          >
            <Checkbox.Group {...checkboxGroupProps} />
          </Form.Item>
        )}
      </Form>
    </Edit>
  );
}
