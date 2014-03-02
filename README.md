# Clean The Web

A [Liquid tag](http://wiki.shopify.com/Liquid) for [Jekyll](http://jekyllrb.com/) that changes the robot meta header based on the post's age.

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
  enable:               true
  new_pages:            "NOARCHIVE, INDEX, FOLLOW"
  old_pages:            "NOARCHIVE, NOINDEX, FOLLOW"
  days_to_age:          90
```

## Usage

`{% cleantheweb %}`

## Output

`<meta name="ROBOTS" content="NOARCHIVE, INDEX, FOLLOW">`
