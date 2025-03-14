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
    questions: [
      {
        text: "I often notice small sounds when others do not",
        options: [
          { text: "Definitely agree", score: 1 },
          { text: "Slightly agree", score: 1 },
          { text: "Slightly disagree", score: 0 },
          { text: "Definitely disagree", score: 0 }
        ]
      },
      {
        text: "I usually concentrate more on the whole picture, rather than the small details",
        options: [
          { text: "Definitely agree", score: 0 },
          { text: "Slightly agree", score: 0 },
          { text: "Slightly disagree", score: 1 },
          { text: "Definitely disagree", score: 1 }
        ]
      }
    
    ]
  }
];


async function seedData() {
  try {
    const { data, error } = await supabase
      .from('adult_assessments')
      .insert(assessments)
      .select();

    if (error) {
      console.error('Error inserting data:', error.message);
      return;
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
