import { defineConfig } from "astro/config";

export default defineConfig({
  site: "https://client-ops.netlify.app",
  markdown: {
    shikiConfig: {
      theme: "github-light",
    },
  },
});
