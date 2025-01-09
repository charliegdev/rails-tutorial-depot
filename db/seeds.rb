# frozen_string_literal: true

Product.create!([
                  { title: 'Docker for Rails Developers',
                    description: "<p>\n      <em>Build, Ship, and Run Your Applications Everywhere</em> Docker does\n      for DevOps what Rails did for web development—it gives you a new set\n      of superpowers. Gone are “works on my machine” woes and lengthy setup\n      tasks, replaced instead by a simple, consistent, Docker-based\n      development environment that will have your team up and running in\n      seconds.  Gain hands-on, real-world experience with a tool that’s\n      rapidly becoming fundamental to software development. Go from zero all\n      the way to production as Docker transforms the massive leap of\n      deploying your app in the cloud into a baby step.\n      </p>", image_url: 'ridocker.jpg', price: '19.95' },
                  { title: 'Design and Build Great Web APIs',
                    description: "<p>\n      <em>Robust, Reliable, and Resilient</em>\n      APIs are transforming the business world at an increasing pace. Gain\n      the essential skills needed to quickly design, build, and deploy\n      quality web APIs that are robust, reliable, and resilient. Go from\n      initial design through prototyping and implementation to deployment of\n      mission-critical APIs for your organization. Test, secure, and deploy\n      your API with confidence and avoid the “release into production”\n      panic. Tackle just about any API challenge with more than a dozen\n      open-source utilities and common programming patterns you can apply\n      right away.\n      </p>", image_url: 'maapis.jpg', price: '24.95' },
                  { title: 'Modern CSS with Tailwind',
                    description: "<p>\n      <em>Flexible Styling Without the Fuss</em>\n      Tailwind CSS is an exciting new CSS framework that allows you to\n      design your site by composing simple utility classes to create complex\n      effects. With Tailwind, you can style your text, move your items on\n      the page, design complex page layouts, and adapt your design for\n      devices from a phone to a wide-screen monitor. With this book, you’ll\n      learn how to use the Tailwind for its flexibility and its consistency,\n      from the smallest detail of your typography to the entire design of\n      your site.\n      </p>", image_url: 'tailwind.jpg', price: '18.95' },
                  { title: 'Sheinizn Hiinear ',
                    description: 'In a future where humanity has colonized the stars, a lone astronaut is stranded on a distant planet. As they struggle to survive, they discover a hidden truth about the universe, and must decide whether to share it with the rest of humanity.', image_url: 'gemini-generated-1.jpeg', price: '20.99' },
                  { title: 'Jarenel',
                    description: "In a city where secrets run deeper than the shadows, a lone figure emerges, haunted by a past they can't escape. As they navigate a treacherous underworld, they must confront their own demons and unravel a conspiracy that threatens to consume them all.", image_url: 'gemini-generated-2.jpeg', price: '35.99' }
                ])

PaymentType.create!(
  [
    { name: 'Check' },
    { name: 'Credit Card' },
    { name: 'Purchase Order' }
  ]
)