CREATE TABLE public.adult_assessments (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  created_at TIMESTAMPTZ DEFAULT NOW(),
  name TEXT NOT NULL,
  description TEXT,
  category TEXT,
  pdf_url TEXT NOT NULL,
  is_adult BOOLEAN DEFAULT true
);
