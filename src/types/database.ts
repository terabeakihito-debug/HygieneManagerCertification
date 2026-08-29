/**
 * DBスキーマに対応する型定義(手動管理の初期版)。
 * 将来的には `supabase gen types typescript` で自動生成に置き換えることを推奨する。
 * 詳細な設計意図は docs/問題データ設計書.md を参照。
 */

export type ExamTypeCode = "type1" | "type2" | "common";
export type SourceType = "past_exam" | "original";
export type AspType = "amazon" | "rakuten";
export type ProductType = "book" | "course" | "goods";

export interface ExamType {
  id: string;
  code: ExamTypeCode;
  name: string;
}

export interface Category {
  id: string;
  exam_type_id: string;
  name: string;
  sort_order: number;
}

export interface Question {
  id: string;
  exam_type_id: string;
  category_id: string;
  question_text: string;
  explanation: string;
  source_type: SourceType;
  source_note: string | null;
  difficulty: number | null;
  created_at: string;
  updated_at: string;
}

export interface Choice {
  id: string;
  question_id: string;
  choice_text: string;
  is_correct: boolean;
  sort_order: number;
}

export interface Product {
  id: string;
  name: string;
  asp: AspType;
  affiliate_url: string;
  image_url: string | null;
  product_type: ProductType;
  exam_type_id: string | null;
  is_active: boolean;
  priority: number;
}

export interface CategoryProduct {
  id: string;
  category_id: string;
  product_id: string;
}

export interface UserProgress {
  id: string;
  user_id: string;
  category_id: string;
  total_answered: number;
  total_correct: number;
  updated_at: string;
}

export interface UserAnswer {
  id: string;
  user_id: string;
  question_id: string;
  selected_choice_id: string;
  is_correct: boolean;
  answered_at: string;
}

export interface ReviewListItem {
  id: string;
  user_id: string;
  question_id: string;
  added_at: string;
  resolved: boolean;
  review_count: number;
}

export interface MockExam {
  id: string;
  exam_type_id: string;
  name: string;
  time_limit_minutes: number;
  question_count: number;
}

export interface MockExamResult {
  id: string;
  user_id: string;
  mock_exam_id: string;
  score: number;
  category_breakdown: Record<string, number>;
  taken_at: string;
}

export interface StudyLog {
  id: string;
  user_id: string;
  study_date: string;
  questions_answered: number;
}

export interface UserSettings {
  user_id: string;
  target_exam_type_id: string | null;
  exam_date: string | null;
  created_at: string;
  updated_at: string;
}
