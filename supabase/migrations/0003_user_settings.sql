create table user_settings (
  user_id uuid primary key references auth.users(id) on delete cascade,
  target_exam_type_id uuid references exam_types(id),
  exam_date date,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

alter table user_settings enable row level security;
create policy "user_settings_own_rows" on user_settings
  for all using (auth.uid() = user_id) with check (auth.uid() = user_id);
