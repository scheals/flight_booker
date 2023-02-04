# Flight Booker

Project specification from [The Odin Project](https://www.theodinproject.com/lessons/ruby-on-rails-flight-booker)

Rubocop config nicked from [Rails](https://github.com/rails/rails/blob/main/.rubocop.yml)

## Musings

Well, I must admit that all this Rails stuff is pretty darn complicated. Just couple of minutes ago thanks to reading other people's
solutions I figured out that I didn't need an additional controller action & route but that has awoken the `bullet` beast that I have no idea how to tame!
Hopefully in time I am going to understand why it points to the `#to_radio` method as the source of eager loading issue.

I had a very tough time getting use out of form helpers as is somewhat evident in this project. With my booking form I opted for doing it old fashioned
HTML way - after I had it working, I had to use the `#accepts_nested_attributes_for` in `Booking` for `Passenger`. Went back to the [Advanced Forms lesson](https://www.theodinproject.com/lessons/ruby-on-rails-advanced-forms#nested-forms), the docs and stared at them for a long while. In the end, my form works!
What's interesting to me is that I only had to do `@booking.passengers.build` once. In other's solutions, they had to do it as many times as they had Passengers.
If I tried that, I'd have duplicated inputs per passenger! And well, it works with a single build, so I am not going to lose much sleep over it. It'll all come in time.

Finding `database_consistency` was also neat 'cause it helped me understand what is good/needed in a database schema. There's still issues like lack of some indexes or foreign key constraints but at least now I know how to add them and modify them (`remove_foreign_key` really did a number on me, I thought the entire column would be gone!)

My seeding procedure could probably be a little less involved when it came to coming up with some random numbers, coming up with silly division to have "more randomness" instead of
using some built-in methods is... questionable. But hey, you live, you learn!

I had great fun playing with model methods & scopes, especially since I haven't done much of them yet. Model methods themselves were something I somewhat "stumbled upon" when
looking for various solutions to formatting dates. No idea why, but it did not occur to me to have Model methods. It was either a class method on the Model itself or a scope.
Previous project, Private Events for sure helped me understand what associations are and how they work. I remember back in Micro Reddit I was just stupified.

This journey is rough but I'm going to keep on keeping on!

### Update after Stimulus improvement

While I worked there was an embarassing amount of syntax errors that I've committed, shame you can't enjoy some kind of sensible feedback besides things not working like you want them to.
That's the beauty and ugliness of `data-attributes` flexibility, I guess. If you do `data-target-controller` instead of `data-controller-target` you'll just have things not work correctly.
I am super interested in Stimulus but I feel like in this case using Turbo would be easier & more sensible given the problems I had to solve. Also it is kind of funny to be using stuff that
I have not yet encountered in JS like `static` keyword, all the `extending` and `this`.

## Features
- You can book one-way flights between two airports.
- If there are multiple flights on a specific date, you can pick a flight departing at specific time.
- Booking handles dynamic amount of passengers, add and remove passengers thanks to Stimulus!
- You can view bookings after they're done.
