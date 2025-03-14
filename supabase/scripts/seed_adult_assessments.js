require('dotenv').config();
const { createClient } = require('@supabase/supabase-js');

// Initialize Supabase client
const supabase = createClient(
  process.env.SUPABASE_URL,
  process.env.SUPABASE_KEY
);

// Assessment data
const assessments = [
  {
    name: "Autism Spectrum Quotient (AQ-10)",
    description: "A brief screening tool for autism spectrum traits in adults aged 16 and over. It consists of 10 statements to assess behaviors and preferences.",
    category: "Autism Assessment",
    pdf_url: "https://file.notion.so/f/f/1f18fd4e-8b48-4f2f-9427-8760b3395c24/01b6f63b-ec99-4a9a-bd0f-124a537202b0/AQ10_Adults.pdf?table=block&id=1b59ba82-75fd-801e-979f-efda12d861fe&spaceId=1f18fd4e-8b48-4f2f-9427-8760b3395c24&expirationTimestamp=1741989600000&signature=oxBKlVhtk7dDzWQXi7vzWK8Vf7IEFO-76l3zJmUQn4A&downloadName=AQ10+Adults.pdf"
  },
];

async function seedData() {
  try {
    const { data, error } = await supabase
      .from('adult_assessments')
      .insert(assessments)
      .select();

    if (error) {
      console.error('Error inserting data:', error.message);
      return; // Exit if there's an error
    }

    if (!data || data.length === 0) {
      console.log('No data returned from Supabase.');
      return;
    }

    console.log(`Successfully inserted ${data.length} records:`, data);
  } catch (err) {
    console.error('Unexpected error:', err.message);
  }
}

seedData();
