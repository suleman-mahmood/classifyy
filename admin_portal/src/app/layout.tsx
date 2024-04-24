import "./globals.css";
import { useNotificationProvider } from "@refinedev/antd";
import { Refine } from "@refinedev/core";
import { RefineKbar, RefineKbarProvider } from "@refinedev/kbar";
import routerProvider from "@refinedev/nextjs-router";
import { Metadata } from "next";
import { cookies } from "next/headers";
import React, { Suspense } from "react";

import { AntdRegistry } from "@ant-design/nextjs-registry";
import { ColorModeContextProvider } from "@contexts/color-mode";
import { authProvider } from "@providers/auth-provider";
import { dataProvider } from "@providers/data-provider";
import "@refinedev/antd/dist/reset.css";

export const metadata: Metadata = {
  title: "Classifyy",
  description: "Admin portal for Classifyy",
  icons: {
    icon: "/favicon.ico",
  },
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  const cookieStore = cookies();
  const theme = cookieStore.get("theme");
  const defaultMode = theme?.value === "dark" ? "dark" : "light";

  return (
    <html lang="en">
      <body>
        <Suspense>
          <RefineKbarProvider>
            <AntdRegistry>
              <ColorModeContextProvider defaultMode={defaultMode}>
                <Refine
                  routerProvider={routerProvider}
                  authProvider={authProvider}
                  dataProvider={dataProvider}
                  notificationProvider={useNotificationProvider}
                  resources={[
                    {
                      name: "users",
                      list: "/users",
                      create: "/users/create",
                      edit: "/users/edit/:id",
                      meta: {
                        canDelete: true,
                      },
                    },
                    {
                      name: "classes",
                      list: "/classes",
                      create: "/classes/create",
                      edit: "/classes/edit/:id",
                      meta: {
                        canDelete: true,
                      },
                    },
                  ]}
                  options={{
                    syncWithLocation: true,
                    warnWhenUnsavedChanges: true,
                    useNewQueryKeys: true,
                    projectId: "p8hhTx-4uRbEq-nUE0Oc",
                  }}
                >
                  {children}
                  <RefineKbar />
                </Refine>
              </ColorModeContextProvider>
            </AntdRegistry>
          </RefineKbarProvider>
        </Suspense>
      </body>
    </html>
  );
}
