import { defineConfig } from "astro/config";

export default defineConfig({
  site: "https://afp-dashboard.netlify.app",
  markdown: {
    shikiConfig: {
      theme: "github-light",
    },
  },
});
