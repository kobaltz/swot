# Swot :apple:

[![Ruby](https://github.com/kobaltz/swot/actions/workflows/ruby.yml/badge.svg?branch=main)](https://github.com/kobaltz/swot/actions/workflows/ruby.yml) [![Update Submodules](https://github.com/kobaltz/swot/actions/workflows/update_domains.yml/badge.svg?branch=main)](https://github.com/kobaltz/swot/actions/workflows/update_domains.yml) [![Gem Version](https://badge.fury.io/rb/swot.svg)](http://badge.fury.io/rb/swot)

If you have a product or service and offer **academic discounts**, there's a good chance there's some manual component to the approval process. Perhaps `.edu` email addresses are automatically approved because, for the most part at least, they're associated with American post-secondary educational institutions. Perhaps `.ac.uk` email addresses are automatically approved because they're guaranteed to belong to British universities and colleges. Unfortunately, not every country has an education-specific TLD (Top Level Domain) and plenty of schools use `.com` or `.net`.

Swot is a community-driven or crowdsourced library for verifying that domain names and email addresses are tied to a legitimate university of college - more specifically, an academic institution providing higher education in tertiary, quaternary or any other kind of post-secondary education in any country in the world.

**Pop quiz:** Which of the following domain names should be eligible for an academic discount? `stanford.edu`, `america.edu`, `duep.edu`, `gla.ac.uk`, `unizar.es`, `usask.ca`, `hil.no`, `unze.ba`, `fu-berlin.de`, `ecla.de`, `bvb.de`, `lsmu.com`. Answers at the foot of the page.

## Note - This is a fork of the original swot gem...
which has since been archived. The original gem has gotten
overwhelmed by false pull requests and issues. This fork
removes the responsibility of maintaining the list of domains
and emails from the gem and instead relies on a submodule
to be updated. There is a nightly job which will update the
submodule and push the changes to this repo. However, to pick up the new domains, a gem release will be required. I'm still
considering the best path for this.

## Versioning

Since there is a reliance on the submodule's data being updated,
there will be periodic releases that do not contain any code changes of this library. However, this library will follow the Semantic versioning + a date stamp of the latest list of academic institutions.

For example, the gem `1.0.2.20230618` references to the gem version `1.0.2` and the list of academic institutions was last updated on `June 18th, 2023`.

### Installation

Or add this to your `Gemfile` before doing a `bundle install`:

`gem 'swot-ruby', require 'swot'`

Do not ref this repo directly in your Gemfile. It will not work. It relies on the submodule to be updated.

## Requirements

- Ruby >= 2.7

Other versions of Ruby may work, but the gem is tested against the above versions.

### Usage

#### Verify Email Addresses

```ruby
Swot::is_academic? 'lreilly@stanford.edu'           # true
Swot::is_academic? 'lreilly@strath.ac.uk'           # true
Swot::is_academic? 'lreilly@soft-eng.strath.ac.uk'  # true
Swot::is_academic? 'pedro@ugr.es'                   # true
Swot::is_academic? 'lee@uottawa.ca'                 # true
Swot::is_academic? 'lee@leerilly.net'               # false
```

#### Verify Domain Names

```ruby
Swot::is_academic? 'harvard.edu'              # true
Swot::is_academic? 'www.harvard.edu'          # true
Swot::is_academic? 'http://www.harvard.edu'   # true
Swot::is_academic? 'http://www.github.com'    # false
Swot::is_academic? 'http://www.rangers.co.uk' # false
```

#### Find School Names

```ruby
Swot::school_name 'lreilly@cs.strath.ac.uk'
# => "University of Strathclyde"

Swot::school_name 'http://www.stanford.edu'
# => "Stanford University"
```

### Contributing to Swot

Contributions welcome! Please see the [contribution guidelines](CONTRIBUTING.md) for details on how to add, update, or delete schools.

**Thanks** to @lreilly for the original implementation and
you can find more thanks for the original contributors on
the original repo.

### Known Issues

* You can search by email and domain names only. You cannot search by IP.
* You don't know if the email address belongs to a student, faculty, staff member, alumni, or a contractor.
* There may be a few false positives, missing institutions... maybe even a couple of typos. Contributions welcome!

**Please note:** just because someone has verified that they own `lreilly@stanford.edu` does *not* mean that they're a student. They could be faculty, staff, alumnni, or maybe even an external contractor. If you're suddenly getting a lot of traffic from websites like [FatWallet](http://www.fatwallet.com) or [SlickDeals](http://www.slickdeals.net), you might want to find out why. If you're suddenly getting a lot of requests from a particular school, you should look into that too. It may be good business, word of mouth, or someone may have found a loophole. Swot gives you a *high confidence level* - not a guarantee. I recommend putting some controls in place or at least monitor how it's doing from time to time.

### Pop Quiz Answers

Hopefully, you'll be surprised by some of this:

| Domain | Academic? | Comments |
|--------|-----------|----------|
|`stanford.edu`|:heavy_check_mark:|OK, this was an easy one so you could get at least *one* right|
|`america.edu`|:heavy_multiplication_x:| Prior to October 29th 2001, anyone could register a `.edu` domain name ([details](https://en.wikipedia.org/wiki/.edu#Grandfathered_uses)) |
|`duep.edu`|:heavy_check_mark:| Alfred Nobel University is a *Ukranian* University *in the Ukraine* i.e. not in the USA :us: |
|`gla.ac.uk`|:heavy_check_mark:|Glasgow University in Scotland|
|`unizar.es`|:heavy_check_mark:|The University of Zaragoza in Spain|
|`usask.ca`|:heavy_check_mark:|The University of Saskatchewan in Canada|
|`hil.no`|:heavy_check_mark:|Lillehammer University College in Norway|
|`unze.ba`|:heavy_check_mark:|University of Zenica in Bosnia and Herzegovina|
|`fu-berlin.de`|:heavy_check_mark:|Free University of Berlin in Germany|
|`ecla.de`|:heavy_check_mark:|ECLA of Bard is a state recognized liberal arts university in Berlin, Germany |
|`bvb.de`|:heavy_multiplication_x:|It's a soccer team from Germany|
|`lsmu.com`|:heavy_check_mark:| Lugansk State Medical University in the Ukraine |

If you verified this by visiting all of the websites, how long did it take you? Did you have fun? Imagine you had to do this 10 - 100 times every day. Now you know a little something about the inspiration for Swot. Swot can verify them all in a fraction of a second and remove a :poop: part of someone's job.

#### Contributing to Swot

##### Updating the database

https://github.com/jetbrains/swot is the canonical source of truth for the list of domains.
If you want to add a new domain, please submit a pull request there. This database is updated
periodically based on the information in that repository.
