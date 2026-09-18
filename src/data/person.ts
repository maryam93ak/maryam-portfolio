// Single source for the schema.org Person used on the homepage and the story page.
// Keep every field consistent with the visible site and the CV.
const siteUrl = "https://www.maryamakhyani.com";

export const person = {
  "@type": "Person",
  "@id": `${siteUrl}/#person`,
  name: "Maryam Akhyani",
  url: siteUrl,
  image: `${siteUrl}/About.jpg`,
  jobTitle: "Product Manager",
  description:
    "Product Manager with a UX Research foundation and a background in architecture. Case studies in navigation and logistics products shipped at scale.",
  email: "mailto:Maryam.Akhyani@gmail.com",
  address: {
    "@type": "PostalAddress",
    addressLocality: "Vancouver",
    addressRegion: "BC",
    addressCountry: "CA",
  },
  alumniOf: [
    { "@type": "CollegeOrUniversity", name: "Shahid Beheshti University" },
    { "@type": "CollegeOrUniversity", name: "Pars University of Art and Architecture" },
  ],
  hasCredential: {
    "@type": "EducationalOccupationalCredential",
    name: "Google Project Management Professional Certificate",
    credentialCategory: "certificate",
  },
  knowsAbout: [
    "Product Management",
    "Product Strategy",
    "UX Research",
    "Usability Testing",
    "A/B Testing",
    "Navigation and mapping products",
    "Logistics and delivery platforms",
    "Architecture",
  ],
  sameAs: [
    "https://www.linkedin.com/in/maryamakhyani/",
    "https://github.com/maryam93ak",
  ],
};
