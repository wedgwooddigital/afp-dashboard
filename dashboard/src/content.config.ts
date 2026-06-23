import { defineCollection, z } from "astro:content";
import { glob } from "astro/loaders";

const category = z.enum(["it", "seo", "marketing", "social", "creative", "billing", "ops", "other"]);

const documents = defineCollection({
  loader: glob({ pattern: ["**/*.md", "!README.md", "!**/README.md"], base: "../content/documents" }),
  schema: z.object({
    title: z.string(),
    description: z.string().optional(),
    date: z.coerce.date(),
    category: category.default("it"),
    clientVisible: z.boolean().default(false),
  }),
});

const updates = defineCollection({
  loader: glob({ pattern: ["**/*.md", "!README.md", "!**/README.md"], base: "../content/updates" }),
  schema: z.object({
    title: z.string(),
    summary: z.string().optional(),
    date: z.coerce.date(),
    category: category.default("ops"),
    clientVisible: z.boolean().default(false),
  }),
});

const brand = defineCollection({
  loader: glob({ pattern: ["**/*.md", "!README.md", "!**/README.md"], base: "../content/brand" }),
  schema: z.object({
    title: z.string(),
    description: z.string().optional(),
    order: z.number().default(0),
    clientVisible: z.boolean().default(false),
    updated: z.coerce.date(),
    sourcePath: z.string().optional(),
  }),
});

const toolboxKind = z.enum(["prompts", "playbooks", "templates", "reference"]);

const toolbox = defineCollection({
  loader: glob({ pattern: ["**/*.md", "!README.md", "!**/README.md"], base: "../content/toolbox" }),
  schema: z.object({
    title: z.string(),
    description: z.string().optional(),
    kind: toolboxKind.default("reference"),
    order: z.number().default(0),
    clientVisible: z.boolean().default(false),
    updated: z.coerce.date(),
    changelog: z.string().optional(),
    tier: z.enum(["all", "diy", "managed"]).default("all"),
    sourcePath: z.string().optional(),
    // Provider-agnostic embed URL. Source/type/delivery are TBC — do not assume
    // a specific provider. Embedded via <iframe>; CSP frame-src must allow the
    // chosen host (see netlify.toml).
    videoUrl: z.string().nullable().optional(),
  }),
});

export const collections = { documents, updates, brand, toolbox };
