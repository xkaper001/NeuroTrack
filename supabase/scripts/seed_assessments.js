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
      },
      {
        text: "I find it easy to do more than one thing at once",
        options: [
          { text: "Definitely agree", score: 0 },
          { text: "Slightly agree", score: 0 },
          { text: "Slightly disagree", score: 1 },
          { text: "Definitely disagree", score: 1 }
        ]
      },
      {
        text: "If there is an interruption, I can switch back to what I was doing very quickly",
        options: [
          { text: "Definitely agree", score: 0 },
          { text: "Slightly agree", score: 0 },
          { text: "Slightly disagree", score: 1 },
          { text: "Definitely disagree", score: 1 }
        ]
      },
      {
        text: "I find it easy to 'read between the lines' when someone is talking to me",
        options: [
          { text: "Definitely agree", score: 0 },
          { text: "Slightly agree", score: 0 },
          { text: "Slightly disagree", score: 1 },
          { text: "Definitely disagree", score: 1 }
        ]
      },
      {
        text: "I know how to tell if someone listening to me is getting bored",
        options: [
          { text: "Definitely agree", score: 0 },
          { text: "Slightly agree", score: 0 },
          { text: "Slightly disagree", score: 1 },
          { text: "Definitely disagree", score: 1 }
        ]
      },
      {
        text: "When I'm reading a story I find it difficult to work out the characters' intentions",
        options: [
          { text: "Definitely agree", score: 1 },
          { text: "Slightly agree", score: 1 },
          { text: "Slightly disagree", score: 0 },
          { text: "Definitely disagree", score: 0 }
        ]
      },
      {
        text: "I like to collect information about categories of things (e.g. types of car, types of bird, types of train, types of plant etc)",
        options: [
          { text: "Definitely agree", score: 1 },
          { text: "Slightly agree", score: 1 },
          { text: "Slightly disagree", score: 0 },
          { text: "Definitely disagree", score: 0 }
        ]
      },
      {
        text: "I find it easy to work out what someone is thinking or feeling just by looking at their face",
        options: [
          { text: "Definitely agree", score: 0 },
          { text: "Slightly agree", score: 0 },
          { text: "Slightly disagree", score: 1 },
          { text: "Definitely disagree", score: 1 }
        ]
      },
      {
        text: "I find it difficult to work out people's intentions",
        options: [
          { text: "Definitely agree", score: 1 },
          { text: "Slightly agree", score: 1 },
          { text: "Slightly disagree", score: 0 },
          { text: "Definitely disagree", score: 0 }
        ]
      }
    ]
  },
  {
    name: "Camouflaging Autistic Traits Questionnaire (CAT-Q)",
    description: "A 25-item self-report measure designed to assess camouflaging strategies in individuals aged 16 years and older.",
    category: "Autism Assessment",
    questions: [
      {
        text: "When I am interacting with someone, I deliberately copy their body language or facial expressions.",
        options: [
          { text: "Strongly Disagree", score: 1 },
          { text: "Disagree", score: 2 },
          { text: "Somewhat Disagree", score: 3 },
          { text: "Neither Agree nor Disagree", score: 4 },
          { text: "Somewhat Agree", score: 5 },
          { text: "Agree", score: 6 },
          { text: "Strongly Agree", score: 7 }
        ]
      },
      {
        text: "I monitor my body language or facial expressions so that I appear relaxed.",
        options: [
          { text: "Strongly Disagree", score: 1 },
          { text: "Disagree", score: 2 },
          { text: "Somewhat Disagree", score: 3 },
          { text: "Neither Agree nor Disagree", score: 4 },
          { text: "Somewhat Agree", score: 5 },
          { text: "Agree", score: 6 },
          { text: "Strongly Agree", score: 7 }
        ]
      },
      {
        text: "I rarely feel the need to put on an act in order to get through a social situation.",
        options: [
          { text: "Strongly Disagree", score: 7 },
          { text: "Disagree", score: 6 },
          { text: "Somewhat Disagree", score: 5 },
          { text: "Neither Agree nor Disagree", score: 4 },
          { text: "Somewhat Agree", score: 3 },
          { text: "Agree", score: 2 },
          { text: "Strongly Agree", score: 1 }
        ]
      },
      {
        text: "I have developed a script to follow in social situations.",
        options: [
          { text: "Strongly Disagree", score: 1 },
          { text: "Disagree", score: 2 },
          { text: "Somewhat Disagree", score: 3 },
          { text: "Neither Agree nor Disagree", score: 4 },
          { text: "Somewhat Agree", score: 5 },
          { text: "Agree", score: 6 },
          { text: "Strongly Agree", score: 7 }
        ]
      },
      {
        text: "I will repeat phrases that I have heard others say in the exact same way that I first heard them.",
        options: [
          { text: "Strongly Disagree", score: 1 },
          { text: "Disagree", score: 2 },
          { text: "Somewhat Disagree", score: 3 },
          { text: "Neither Agree nor Disagree", score: 4 },
          { text: "Somewhat Agree", score: 5 },
          { text: "Agree", score: 6 },
          { text: "Strongly Agree", score: 7 }
        ]
      },
      {
        text: "I adjust my body language or facial expressions so that I appear interested by the person I am interacting with.",
        options: [
          { text: "Strongly Disagree", score: 1 },
          { text: "Disagree", score: 2 },
          { text: "Somewhat Disagree", score: 3 },
          { text: "Neither Agree nor Disagree", score: 4 },
          { text: "Somewhat Agree", score: 5 },
          { text: "Agree", score: 6 },
          { text: "Strongly Agree", score: 7 }
        ]
      },

      {
        text: "In social situations, I feel like I'm 'performing' rather than being myself.",
        options: [
          { text: "Strongly Disagree", score: 1 },
          { text: "Disagree", score: 2 },
          { text: "Somewhat Disagree", score: 3 },
          { text: "Neither Agree nor Disagree", score: 4 },
          { text: "Somewhat Agree", score: 5 },
          { text: "Agree", score: 6 },
          { text: "Strongly Agree", score: 7 }
        ]
      },
      {
        text: "In my own social interactions, I use behaviours that I have learned from watching other people interacting.",
        options: [
          { text: "Strongly Disagree", score: 1 },
          { text: "Disagree", score: 2 },
          { text: "Somewhat Disagree", score: 3 },
          { text: "Neither Agree nor Disagree", score: 4 },
          { text: "Somewhat Agree", score: 5 },
          { text: "Agree", score: 6 },
          { text: "Strongly Agree", score: 7 }
        ]
      },
      {
        text: "I always think about the impression I make on other people.",
        options: [
          { text: "Strongly Disagree", score: 1 },
          { text: "Disagree", score: 2 },
          { text: "Somewhat Disagree", score: 3 },
          { text: "Neither Agree nor Disagree", score: 4 },
          { text: "Somewhat Agree", score: 5 },
          { text: "Agree", score: 6 },
          { text: "Strongly Agree", score: 7 }
        ]
      },
      {
        text: "I need the support of other people in order to socialise.",
        options: [
          { text: "Strongly Disagree", score: 1 },
          { text: "Disagree", score: 2 },
          { text: "Somewhat Disagree", score: 3 },
          { text: "Neither Agree nor Disagree", score: 4 },
          { text: "Somewhat Agree", score: 5 },
          { text: "Agree", score: 6 },
          { text: "Strongly Agree", score: 7 }
        ]
      },
      {
        text: "I practice my facial expressions and body language to make sure they look natural.",
        options: [
          { text: "Strongly Disagree", score: 1 },
          { text: "Disagree", score: 2 },
          { text: "Somewhat Disagree", score: 3 },
          { text: "Neither Agree nor Disagree", score: 4 },
          { text: "Somewhat Agree", score: 5 },
          { text: "Agree", score: 6 },
          { text: "Strongly Agree", score: 7 }
        ]
      },
      {
        text: "I don't feel the need to make eye contact with other people if I don't want to.",
        options: [
          { text: "Strongly Disagree", score: 7 },
          { text: "Disagree", score: 6 },
          { text: "Somewhat Disagree", score: 5 },
          { text: "Neither Agree nor Disagree", score: 4 },
          { text: "Somewhat Agree", score: 3 },
          { text: "Agree", score: 2 },
          { text: "Strongly Agree", score: 1 }
        ]
      },
      {
        text: "I have to force myself to interact with people when I am in social situations.",
        options: [
          { text: "Strongly Disagree", score: 1 },
          { text: "Disagree", score: 2 },
          { text: "Somewhat Disagree", score: 3 },
          { text: "Neither Agree nor Disagree", score: 4 },
          { text: "Somewhat Agree", score: 5 },
          { text: "Agree", score: 6 },
          { text: "Strongly Agree", score: 7 }
        ]
      },
      {
        text: "I have tried to improve my understanding of social skills by watching other people.",
        options: [
          { text: "Strongly Disagree", score: 1 },
          { text: "Disagree", score: 2 },
          { text: "Somewhat Disagree", score: 3 },
          { text: "Neither Agree nor Disagree", score: 4 },
          { text: "Somewhat Agree", score: 5 },
          { text: "Agree", score: 6 },
          { text: "Strongly Agree", score: 7 }
        ]
      },
      {
        text: "I monitor my body language or facial expressions so that I appear interested by the person I am interacting with.",
        options: [
          { text: "Strongly Disagree", score: 1 },
          { text: "Disagree", score: 2 },
          { text: "Somewhat Disagree", score: 3 },
          { text: "Neither Agree nor Disagree", score: 4 },
          { text: "Somewhat Agree", score: 5 },
          { text: "Agree", score: 6 },
          { text: "Strongly Agree", score: 7 }
        ]
      },
      {
        text: "When in social situations, I try to find ways to avoid interacting with others.",
        options: [
          { text: "Strongly Disagree", score: 1 },
          { text: "Disagree", score: 2 },
          { text: "Somewhat Disagree", score: 3 },
          { text: "Neither Agree nor Disagree", score: 4 },
          { text: "Somewhat Agree", score: 5 },
          { text: "Agree", score: 6 },
          { text: "Strongly Agree", score: 7 }
        ]
      },
      {
        text: "I have researched the rules of social interactions to improve my own social skills.",
        options: [
          { text: "Strongly Disagree", score: 1 },
          { text: "Disagree", score: 2 },
          { text: "Somewhat Disagree", score: 3 },
          { text: "Neither Agree nor Disagree", score: 4 },
          { text: "Somewhat Agree", score: 5 },
          { text: "Agree", score: 6 },
          { text: "Strongly Agree", score: 7 }
        ]
      },
      {
        text: "I am always aware of the impression I make on other people.",
        options: [
          { text: "Strongly Disagree", score: 1 },
          { text: "Disagree", score: 2 },
          { text: "Somewhat Disagree", score: 3 },
          { text: "Neither Agree nor Disagree", score: 4 },
          { text: "Somewhat Agree", score: 5 },
          { text: "Agree", score: 6 },
          { text: "Strongly Agree", score: 7 }
        ]
      },
      {
        text: "I feel free to be myself when I am with other people.",
        options: [
          { text: "Strongly Disagree", score: 7 },
          { text: "Disagree", score: 6 },
          { text: "Somewhat Disagree", score: 5 },
          { text: "Neither Agree nor Disagree", score: 4 },
          { text: "Somewhat Agree", score: 3 },
          { text: "Agree", score: 2 },
          { text: "Strongly Agree", score: 1 }
        ]
      },
      {
        text: "I learn how people use their bodies and faces to interact by watching television or films, or by reading fiction.",
        options: [
          { text: "Strongly Disagree", score: 1 },
          { text: "Disagree", score: 2 },
          { text: "Somewhat Disagree", score: 3 },
          { text: "Neither Agree nor Disagree", score: 4 },
          { text: "Somewhat Agree", score: 5 },
          { text: "Agree", score: 6 },
          { text: "Strongly Agree", score: 7 }
        ]
      },
      {
        text: "I adjust my body language or facial expressions so that I appear relaxed.",
        options: [
          { text: "Strongly Disagree", score: 1 },
          { text: "Disagree", score: 2 },
          { text: "Somewhat Disagree", score: 3 },
          { text: "Neither Agree nor Disagree", score: 4 },
          { text: "Somewhat Agree", score: 5 },
          { text: "Agree", score: 6 },
          { text: "Strongly Agree", score: 7 }
        ]
      },
      {
        text: "When talking to other people, I feel like the conversation flows naturally.",
        options: [
          { text: "Strongly Disagree", score: 7 },
          { text: "Disagree", score: 6 },
          { text: "Somewhat Disagree", score: 5 },
          { text: "Neither Agree nor Disagree", score: 4 },
          { text: "Somewhat Agree", score: 3 },
          { text: "Agree", score: 2 },
          { text: "Strongly Agree", score: 1 }
        ]
      },
      {
        text: "I have spent time learning social skills from television shows and films, and try to use these in my interactions.",
        options: [
          { text: "Strongly Disagree", score: 1 },
          { text: "Disagree", score: 2 },
          { text: "Somewhat Disagree", score: 3 },
          { text: "Neither Agree nor Disagree", score: 4 },
          { text: "Somewhat Agree", score: 5 },
          { text: "Agree", score: 6 },
          { text: "Strongly Agree", score: 7 }
        ]
      },
      {
        text: "In social interactions, I do not pay attention to what my face or body are doing.",
        options: [
          { text: "Strongly Disagree", score: 7 },
          { text: "Disagree", score: 6 },
          { text: "Somewhat Disagree", score: 5 },
          { text: "Neither Agree nor Disagree", score: 4 },
          { text: "Somewhat Agree", score: 3 },
          { text: "Agree", score: 2 },
          { text: "Strongly Agree", score: 1 }
        ]
      },
      {
        text: "In social situations, I feel like I am pretending to be 'normal'.",
        options: [
          { text: "Strongly Disagree", score: 1 },
          { text: "Disagree", score: 2 },
          { text: "Somewhat Disagree", score: 3 },
          { text: "Neither Agree nor Disagree", score: 4 },
          { text: "Somewhat Agree", score: 5 },
          { text: "Agree", score: 6 },
          { text: "Strongly Agree", score: 7 }
        ]
      }
    ]
  }

];


async function seedData() {
  try {
    const { data, error } = await supabase
      .from('assessments')
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
