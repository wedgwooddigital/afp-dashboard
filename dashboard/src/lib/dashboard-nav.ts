import { getCollection } from "astro:content";
import { site } from "../config/site";
import {
  getDashboardTier,
  isPublishableBrand,
  isPublishableToolbox,
} from "./dashboard-visibility";

export const formatDate = (date: Date) =>
  date.toLocaleDateString("en-GB", {
    day: "numeric",
    month: "short",
    year: "numeric",
  });

export { getDashboardTier };

export async function loadSidebarNav() {
  const documents = (
    await getCollection("documents", ({ data }) => data.clientVisible)
  ).sort((a, b) => b.data.date.valueOf() - a.data.date.valueOf());

  const updates = (
    await getCollection("updates", ({ data }) => data.clientVisible)
  ).sort((a, b) => b.data.date.valueOf() - a.data.date.valueOf());

  const documentNav = documents.map((document) => ({
    href: site.paths.document(document.id),
    label: document.data.title,
    meta: formatDate(document.data.date),
  }));

  const updateNav = updates.map((update) => ({
    href: site.paths.update(update.id),
    label: update.data.title,
    meta: formatDate(update.data.date),
  }));

  return { documentNav, updateNav };
}

export async function loadBrandPages() {
  return (await getCollection("brand", ({ data }) => isPublishableBrand(data))).sort(
    (a, b) =>
      a.data.order - b.data.order ||
      a.data.title.localeCompare(b.data.title, "en-GB"),
  );
}

export async function loadToolboxPages() {
  return (await getCollection("toolbox", ({ data }) => isPublishableToolbox(data))).sort(
    (a, b) =>
      a.data.order - b.data.order ||
      a.data.title.localeCompare(b.data.title, "en-GB"),
  );
}

export type ToolboxKind = "prompts" | "playbooks" | "templates" | "reference";

export const toolboxKindLabels: Record<ToolboxKind, string> = {
  reference: "Reference",
  prompts: "Prompts",
  playbooks: "Playbooks",
  templates: "Templates",
};

export const toolboxKindOrder: ToolboxKind[] = [
  "reference",
  "prompts",
  "playbooks",
  "templates",
];
