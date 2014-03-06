# Clean The Web

A [Liquid tag](http://wiki.shopify.com/Liquid) for [Jekyll](http://jekyllrb.com/) that changes the robot meta header based on the post's age.

I believe that the Internet is littered with old and worthless content that needs to "disappear" from search engines so that more relevant information can rise to the top.  Most of this content comes in the form of blog posts that, while relevant for a certain period of time, quickly lose their value.  Some may argue that generating traffic to a blog/site is more valuable but I believe that this is the wrong type of traffic to acquire.  Why lure users to your site knowing that the content they will find won't be relevant for them.  This plugin attempts to give content creators automatic, fine-grained control over search engine indexing of a site.  Pages will automatically get the "initial" global robot meta directive unless changed in that page's YAML.  Blog posts will start with this same "initial" global meta directive (or the page's "initial" meta directive if set) but after the date hits the page's "activate_date" or the "days_to_age" for the page or globally (in that order of precedence), the page will switch to the "old" meta directive for the page or globally (again, in that order of precedence).

* __Author:__ Sanjay Parekh
* __Site:__ [http://www.sanjayparekh.com/](http://www.sanjayparekh.com/)
* __Twitter:__ [@sanjay](https://twitter.com/intent/user?screen_name=sanjay)
* __Source:__ [https://github.com/sanjay/jekyll-cleantheweb](https://github.com/sanjay/jekyll-cleantheweb)

## Installation

1. Copy **jekyll-cleantheweb.rb** into your site’s **_plugins** directory
2. Add desired parameters (see [Configuration](#configuration)) to **_config.yml**
3. Add `{% cleantheweb %}` tag to your page, post, or template's HEAD attribute.

## Configuration

The following parameters are set globally in **_config.yml**.

```
cleantheweb:
  enable:       true
  quiet:        false
  initial:      "NOARCHIVE, INDEX, FOLLOW"
  old:          "NOARCHIVE, NOINDEX, FOLLOW"
  days_to_age:  90
```

The following parameters can be set on a per page or per post basis in the YAML front matter.

```
cleantheweb:
  enable:         true
  initial:        "NOARCHIVE, INDEX, FOLLOW, SNIPPET"
  old:            "NOARCHIVE, NOINDEX, FOLLOW, SNIPPET"
  activate_date:  2014-03-05
  days_to_age:    120
```

## Usage

`{% cleantheweb %}`

## Output

`<meta name="ROBOTS" content="NOARCHIVE, INDEX, FOLLOW">`
