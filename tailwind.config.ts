import typography from "@tailwindcss/typography";
import type { Config } from "tailwindcss";

const config: Config = {
  content: [
    "./src/app/**/*.{js,ts,jsx,tsx,mdx}",
    "./src/components/**/*.{js,ts,jsx,tsx,mdx}",
  ],
  theme: {
    extend: {
      colors: {
        paper: "#F1F1EC",
        ink: "#14211A",
        safety: {
          DEFAULT: "#1F6E45",
          dark: "#143F29",
        },
        stamp: "#B23A2E",
        amber: "#C9932B",
        graphite: "#4B4F49",
        hairline: "#D8D6CB",
      },
      fontFamily: {
        display: ["var(--font-display)", "sans-serif"],
        body: ["var(--font-body)", "sans-serif"],
        mono: ["var(--font-mono)", "ui-monospace", "monospace"],
      },
    },
  },
  plugins: [typography],
};

export default config;
