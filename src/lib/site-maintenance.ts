import { currentExam } from "@/config/exams";
import { isLiveExam } from "@/lib/question-visibility";

export const SITE_MAINTENANCE = !isLiveExam(currentExam.id);
