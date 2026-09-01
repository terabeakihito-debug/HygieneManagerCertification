-- 過去問の図表参照。図表が必要な設問だけ値を入れる。
alter table questions add column if not exists figure_url text;
