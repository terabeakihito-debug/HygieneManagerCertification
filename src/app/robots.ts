import type { MetadataRoute } from "next";
import { SITE_URL } from "@/lib/seo";
import { SITE_MAINTENANCE } from "@/lib/site-maintenance";

export default function robots(): MetadataRoute.Robots {
  if (SITE_MAINTENANCE) {
    return {
      rules: {
        userAgent: "*",
        disallow: "/",
      },
    };
  }

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
