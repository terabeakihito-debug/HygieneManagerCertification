import { isLiveExam } from "@/lib/question-visibility";

export const SITE_MAINTENANCE = !isLiveExam(process.env.NEXT_PUBLIC_EXAM_ID);
