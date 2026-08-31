import type { Metadata } from "next";
import { currentExam } from "@/config/exams";

export const SITE_URL =
  process.env.NEXT_PUBLIC_SITE_URL?.replace(/\/$/, "") ?? "https://hygiene.examstudycoach.com";

export const SITE_NAME = currentExam.siteName;

export const SITE_DESCRIPTION = currentExam.seo.description;

export const noIndexRobots = {
  index: false,
  follow: false,
} as const satisfies Metadata["robots"];

export const noIndexMetadata = {
  robots: noIndexRobots,
} as const satisfies Metadata;

export function topicDescription(body: string): string {
  const compact = body.replace(/\s+/g, " ").trim();
  if (compact.length <= 100) {
    return compact;
  }
  return `${compact.slice(0, 100)}…`;
}
