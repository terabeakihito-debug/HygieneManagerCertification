import {
  MIN_ANSWERS_FOR_WEAK_JUDGMENT,
  WEAK_ACCURACY_THRESHOLD,
} from "@/lib/data/progress";
import { createClient } from "@/lib/supabase/server";
import type { AspType } from "@/types/database";

export type RecommendedProduct = {
  id: string;
  name: string;
  asp: AspType;
  affiliate_url: string;
};

type ProgressRow = {
  category_id: string;
  total_answered: number;
  total_correct: number;
};

type CategoryProductRow = {
  product_id: string;
};

type ProductRow = {
  id: string;
  name: string;
  asp: AspType;
  affiliate_url: string;
  is_active: boolean;
  priority: number;
};

function isAspType(value: string): value is AspType {
  switch (value) {
    case "amazon":
    case "rakuten":
      return true;
    default:
      return false;
  }
}

async function fetchActiveProductsForCategories(
  categoryIds: string[],
  limit: number
): Promise<RecommendedProduct[]> {
  if (categoryIds.length === 0 || limit <= 0) {
    return [];
  }

  const supabase = await createClient();
  const { data: links, error: linkError } = await supabase
    .from("category_products")
    .select("product_id")
    .in("category_id", categoryIds);

  if (linkError) {
    return [];
  }

  const productIds = [
    ...new Set(((links ?? []) as CategoryProductRow[]).map((row) => row.product_id)),
  ];
  if (productIds.length === 0) {
    return [];
  }

  const { data: products, error: productError } = await supabase
    .from("products")
    .select("id, name, asp, affiliate_url, is_active, priority")
    .in("id", productIds)
    .eq("is_active", true)
    .order("priority", { ascending: true });

  if (productError) {
    return [];
  }

  return ((products ?? []) as ProductRow[])
    .filter((product) => isAspType(product.asp))
    .slice(0, limit)
    .map((product) => ({
      id: product.id,
      name: product.name,
      asp: product.asp,
      affiliate_url: product.affiliate_url,
    }));
}

export async function getRecommendedProductsForUser(
  userId: string,
  limit = 3
): Promise<RecommendedProduct[]> {
  const supabase = await createClient();
  const { data, error } = await supabase
    .from("user_progress")
    .select("category_id, total_answered, total_correct")
    .eq("user_id", userId);

  if (error) {
    return [];
  }

  const weakCategoryIds = ((data ?? []) as ProgressRow[])
    .filter((row) => {
      if (row.total_answered < MIN_ANSWERS_FOR_WEAK_JUDGMENT) {
        return false;
      }
      return row.total_correct / row.total_answered < WEAK_ACCURACY_THRESHOLD;
    })
    .map((row) => row.category_id);

  return fetchActiveProductsForCategories(weakCategoryIds, limit);
}

export async function getRecommendedProductsForCategory(
  categoryId: string,
  limit = 3
): Promise<RecommendedProduct[]> {
  return fetchActiveProductsForCategories([categoryId], limit);
}

export async function getRecommendedProductsForCategories(
  categoryIds: string[],
  limit = 2
): Promise<RecommendedProduct[]> {
  return fetchActiveProductsForCategories([...new Set(categoryIds)], limit);
}
