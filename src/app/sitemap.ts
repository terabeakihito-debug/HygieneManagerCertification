import type { MetadataRoute } from "next";
import { currentExam } from "@/config/exams";
import { LEARN_TOPICS } from "@/lib/data/learn-content";
import { SITE_URL } from "@/lib/seo";

export default function sitemap(): MetadataRoute.Sitemap {
  const lastModified = new Date();
  const learnEntries = currentExam.hasLearnContent
    ? [
        {
          url: `${SITE_URL}/learn`,
          lastModified,
          changeFrequency: "weekly" as const,
          priority: 0.8,
        },
        ...LEARN_TOPICS.map((topic) => ({
          url: `${SITE_URL}/learn/${topic.id}`,
          lastModified,
          changeFrequency: "monthly" as const,
          priority: 0.6,
        })),
      ]
    : [];

  return [
    {
      url: SITE_URL,
      lastModified,
      changeFrequency: "weekly",
      priority: 1,
    },
    ...learnEntries,
    {
      url: `${SITE_URL}/privacy`,
      lastModified,
      changeFrequency: "yearly",
      priority: 0.3,
    },
  ];
}
