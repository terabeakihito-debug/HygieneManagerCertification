import type { MetadataRoute } from "next";
import { SITE_URL } from "@/lib/seo";

export default function robots(): MetadataRoute.Robots {
  return {
    rules: {
      userAgent: "*",
      allow: ["/", "/learn", "/learn/", "/privacy"],
      disallow: [
        "/practice",
        "/progress",
        "/review",
        "/mock-exams",
        "/login",
        "/signup",
        "/mypage",
        "/upgrade-account",
        "/calendar",
        "/auth",
      ],
    },
    sitemap: `${SITE_URL}/sitemap.xml`,
  };
}
