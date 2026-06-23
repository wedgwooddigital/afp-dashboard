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

export const collections = { documents, updates };
